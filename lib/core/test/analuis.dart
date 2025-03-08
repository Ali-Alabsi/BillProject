import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InvoiceScannerScreen extends StatefulWidget {
  @override
  _InvoiceScannerScreenState createState() => _InvoiceScannerScreenState();
}

class _InvoiceScannerScreenState extends State<InvoiceScannerScreen> {
  String _ocrText = "";

  // اختيار الصورة من المعرض
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final text = await FlutterTesseractOcr.extractText(pickedFile.path);
      setState(() {
        _ocrText = text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner Invoice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick an Image'),
            ),
            SizedBox(height: 20),
            Text(
              _ocrText.isNotEmpty ? _ocrText : "No Text Detected",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
