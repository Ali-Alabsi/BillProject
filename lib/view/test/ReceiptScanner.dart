// import 'package:flutter/material.dart';
// import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
//
// void main() => runApp(MyAppReceiptScanner());
//
// class MyAppReceiptScanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ReceiptScanner(),
//     );
//   }
// }
//
// class ReceiptScanner extends StatefulWidget {
//   @override
//   _ReceiptScannerState createState() => _ReceiptScannerState();
// }
//
// class _ReceiptScannerState extends State<ReceiptScanner> {
//   List<String> _items = [];
//   String _total = '';
//   String _date = '';
//
//   Future<void> _scanReceipt() async {
//     List<OcrText> texts = [];
//     try {
//       texts = (await FlutterMobileVision.scan(
//         fps: 2.0,
//         autoFocus: true,
//         multiple: true,
//         waitTap: true,
//       )).cast<OcrText>();
//     } catch (e) {
//       print('Error: $e');
//     }
//
//     _parseReceipt(texts);
//   }
//
//   void _parseReceipt(List<OcrText> texts) {
//     List<String> items = [];
//     String total = '';
//     String date = '';
//
//     for (OcrText text in texts) {
//       String line = text.value;
//
//       // استخراج المنتجات (مثال: "2x Coffee 5.00")
//       if (line.contains(RegExp(r'\d+\.\d{2}'))) {
//         items.add(line);
//       }
//
//       // استخراج الإجمالي (مثال: "Total: 25.00")
//       if (line.toLowerCase().contains('total')) {
//         total = line.replaceAll(RegExp(r'[^0-9\.]'), '');
//       }
//
//       // استخراج التاريخ (مثال: "2023-12-31")
//       if (line.contains(RegExp(r'\d{4}-\d{2}-\d{2}'))) {
//         date = line;
//       }
//     }
//
//     setState(() {
//       _items = items;
//       _total = total;
//       _date = date;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Receipt Scanner')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _scanReceipt,
//             child: Text('Scan Receipt'),
//           ),
//           _buildReceiptData(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReceiptData() {
//     return Expanded(
//       child: ListView(
//         children: [
//           ListTile(title: Text('Date: $_date')),
//           Divider(),
//           ..._items.map((item) => ListTile(title: Text(item))).toList(),
//           Divider(),
//           ListTile(title: Text('Total: $_total')),
//         ],
//       ),
//     );
//   }
// }