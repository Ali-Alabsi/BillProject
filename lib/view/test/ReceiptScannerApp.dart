import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(ReceiptScannerApp());

class ReceiptScannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'قارئ الفواتير الذكي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',

      ),
      home: ReceiptScannerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReceiptScannerScreen extends StatefulWidget {
  @override
  _ReceiptScannerScreenState createState() => _ReceiptScannerScreenState();
}

class _ReceiptScannerScreenState extends State<ReceiptScannerScreen> {
  String? _scannedDate;
  String? _scannedTotal;
  List<Map<String, String>> _scannedProducts = [];
  bool _isProcessing = false;
  XFile? _selectedImage;

  final Map<String, String> _arabicNumbers = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9'
  };

  Future<void> _captureAndProcessImage() async {
    setState(() => _isProcessing = true);

    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1500,
      );

      if (image != null) {
        setState(() => _selectedImage = image);
        await _processImage(image.path);
      }
    } catch (e) {
      _showErrorDialog('خطأ في معالجة الصورة: ${e.toString()}');
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _processImage(String imagePath) async {
    final textRecognizer = GoogleMlKit.vision.textRecognizer(
      script: TextRecognitionScript.latin,
      // options: TextRecognizerOptions(script: TextRecognitionScript.latin),
    );

    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final recognizedText = await textRecognizer.processImage(inputImage);
      await _extractReceiptData(_normalizeText(recognizedText.text));
    } finally {
      await textRecognizer.close();
    }
  }

  String _normalizeText(String text) {
    // تحويل الأرقام العربية إلى لاتينية وتحسين النص للمعالجة
    return text.replaceAllMapped(RegExp(r'[٠-٩]'),
            (match) => _arabicNumbers[match.group(0)] ?? match.group(0)!)
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(',', '.')
        .toLowerCase();
  }

  Future<void> _extractReceiptData(String fullText) async {
    final lines = fullText.split('\n');
    final extractedData = {
      'date': _extractDate(lines),
      'total': _extractTotal(lines),
      'products': _extractProducts(lines),
    };

    setState(() {
      _scannedDate = extractedData['date'] as String?;
      _scannedTotal = extractedData['total'] as String?;
      _scannedProducts = extractedData['products'] as List<Map<String, String>>;
    });

    if (_scannedDate == null || _scannedTotal == null) {
      _showErrorDialog('يوجد بيانات ناقصة، الرجاء التأكد من وضوح الفاتورة');
    }
  }

  String? _extractDate(List<String> lines) {
    final datePatterns = [
      // أنماط التاريخ المختلفة
      RegExp(r'(\d{1,2}[\/\-\.]([0-3]?\d|[\u0660-\u0663][\u0660-\u0669])[\/\-\.](\d{2,4}))'),
      RegExp(r'(\d{1,2}\s+[\u0621-\u064A]+\s+\d{4})'), // التاريخ الهجري
      RegExp(r'(?:تاريخ|date)\s*[:\.]?\s*(\d{2,4}[\/\-\.]\d{1,2}[\/\-\.]\d{1,2})'),
    ];

    for (final line in lines) {
      for (final pattern in datePatterns) {
        final match = pattern.firstMatch(line);
        if (match != null) return match.group(1)?.trim();
      }
    }
    return null;
  }

  String? _extractTotal(List<String> lines) {
    final totalPatterns = [
      RegExp(r'(الإجمالي|المجموع|total)\s*[:\.]?\s*([\$€£]?\s*\d+\.\d{2})'),
      RegExp(r'([\$€£]\d+\.\d{2})(?=\s*الإجمالي)'),
      RegExp(r'\b(?:total amount|المبلغ الإجمالي)\b\s*([\$€£]?\s*\d+\.\d{2})'),
    ];

    for (final line in lines.reversed) { // البحث من الأسفل للأعلى
      for (final pattern in totalPatterns) {
        final match = pattern.firstMatch(line);
        if (match != null) return match.group(1) ?? match.group(2);
      }
    }
    return null;
  }

  List<Map<String, String>> _extractProducts(List<String> lines) {
    final productPattern = RegExp(
      r'(\d+)\s*[x×*]\s*([^\d\$€£]+?)\s+([\$€£]?\s*\d+\.\d{2})',
      caseSensitive: false,
    );

    final products = <Map<String, String>>[];

    for (final line in lines) {
      final match = productPattern.firstMatch(line);
      if (match != null) {
        products.add({
          'quantity': match.group(1)!,
          'name': match.group(2)!.trim(),
          'price': match.group(3)!,
        });
      }
    }
    return products;
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
      title: Text('تنبيه'),
      content: Text(message),
      actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: Text('موافق'))],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ماسح الفاتورة'),
        actions: [
          if (_selectedImage != null)
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('الصورة المحددة'),
                  content: Image.file(File(_selectedImage!.path)),
                ),
              ),
            ),
        ],
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildScanButton(),
          SizedBox(height: 20),
          if (_scannedDate != null) _buildDataCard('التاريخ', _scannedDate!),
          if (_scannedTotal != null) _buildDataCard('المبلغ الإجمالي', _scannedTotal!),
          if (_scannedProducts.isNotEmpty) _buildProductsList(),
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    return ElevatedButton.icon(
        icon: Icon(_isProcessing ? Icons.hourglass_top : Icons.scanner),
    label: Text(_isProcessing ? 'جاري التحليل...' : 'مسح فاتورة'),
    onPressed: _isProcessing ? null : _captureAndProcessImage,
    style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ));
  }

  Widget _buildDataCard(String title, String value) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(value, style: TextStyle(color: Colors.blue[800], fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('تفاصيل المشتريات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Divider(thickness: 1.5),
              Expanded(
                child: ListView.separated(
                  itemCount: _scannedProducts.length,
                  separatorBuilder: (_, __) => Divider(height: 1),
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(child: Text('${i + 1}')),
                    title: Text(_scannedProducts[i]['name']!),
                    subtitle: Text('الكمية: ${_scannedProducts[i]['quantity']}'),
                    trailing: Text(_scannedProducts[i]['price']!,
                        style: TextStyle(color: Colors.green[800])),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}