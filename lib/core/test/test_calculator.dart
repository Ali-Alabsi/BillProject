import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Variables for real estate calculator
  double? inputNumber;
  String selectedPeriod = "ايجار سنه";
  double realEstateResult = 0;

  // Variables for normal calculator
  String normalInput = "";
  String normalResult = "0";

  // Mode selection
  String calculatorMode = "عقار"; // "عقار" or "عادية"

  // Functions for real estate calculator
  void calculateRealEstate() {
    int multiplier = selectedPeriod == "ايجار سنتين"
        ? 24
        : selectedPeriod == "ايجار سته اشهر"
        ? 6
        : 12;
    setState(() {
      realEstateResult = (inputNumber ?? 0) * multiplier;
    });
  }

  // Functions for normal calculator
  void appendToNormalInput(String value) {
    setState(() {
      normalInput += value;
    });
  }

  void calculateNormal() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(normalInput);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);

      setState(() {
        normalResult = eval.toString();
        normalInput = "";
      });
    } catch (e) {
      setState(() {
        normalResult = "خطأ في العملية";
      });
    }
  }

  void clearNormalInput() {
    setState(() {
      normalInput = "";
      normalResult = "0";
    });
  }

  void deleteLastCharacter() {
    if (normalInput.isNotEmpty) {
      setState(() {
        normalInput = normalInput.substring(0, normalInput.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حاسبة"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text("عقار"),
                  selected: calculatorMode == "عقار",
                  onSelected: (selected) {
                    setState(() {
                      calculatorMode = "عقار";
                    });
                  },
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text("عادية"),
                  selected: calculatorMode == "عادية",
                  onSelected: (selected) {
                    setState(() {
                      calculatorMode = "عادية";
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            calculatorMode == "عقار"
                ? _buildRealEstateCalculator()
                : _buildNormalCalculator(),
          ],
        ),
      ),
    );
  }
  Widget _buildRealEstateCalculator() {
    final TextEditingController totalAmountController = TextEditingController();
    final TextEditingController monthlyPaymentController = TextEditingController();

    double? totalAmount; // المبلغ الإجمالي
    double? monthlyPayment; // القدرة الشهرية
    int? monthsRequired; // عدد الشهور المطلوبة

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // إدخال السعر الإجمالي
            TextFormField(
              controller: totalAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "أدخل السعر الإجمالي"),
              onChanged: (value) {
                // تحديث المبلغ الإجمالي
                totalAmount = double.tryParse(value);
              },
            ),
            SizedBox(height: 16),
        
            // إدخال القدرة الشهرية
            TextFormField(
              controller: monthlyPaymentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "أدخل القدرة على الدفع الشهري"),
              onChanged: (value) {
                // تحديث القدرة الشهرية
                monthlyPayment = double.tryParse(value);
              },
            ),
            SizedBox(height: 16),
        
            // زر حساب عدد الشهور
            ElevatedButton(
              onPressed: () {
                setState(() {
                  totalAmount = double.tryParse(totalAmountController.text);
                  monthlyPayment = double.tryParse(monthlyPaymentController.text);
                  print(totalAmount);
                  print(monthlyPayment);
                  if (totalAmount != null &&
                      monthlyPayment != null &&
                      monthlyPayment! > 0) {
                    monthsRequired = (totalAmount! / monthlyPayment!).ceil();
                    print(monthsRequired);
                  } else {
                    print('Type Null');
                    // monthsRequired = null;
                  }
                });
              },
              child: Text("احسب عدد الشهور"),
            ),
        
            // عرض النتيجة
            SizedBox(height: 16),
            // Text(
            //   monthsRequired != null
            //       ? "عدد الشهور المطلوبة: $monthsRequired"
            //       : "يرجى إدخال قيم صحيحة (المبلغ والدفعة الشهرية أكبر من صفر).",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            Text("عدد الشهور المطلوبة: 4" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
        
            // الحاسبة الأصلية للعقارات
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "أدخل الرقم (لحساب الفترة الزمنية)"),
              onChanged: (value) {
                setState(() {
                  inputNumber = double.tryParse(value);
                });
              },
            ),
            SizedBox(height: 16),
            Text("اختر الفترة الزمنية:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["ايجار سنتين", "ايجار سته اشهر", "ايجار سنه"].map((period) {
                return ChoiceChip(
                  label: Text(period),
                  selected: selectedPeriod == period,
                  onSelected: (selected) {
                    setState(() {
                      selectedPeriod = period;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateRealEstate,
              child: Text("احسب الفترة الزمنية"),
            ),
            SizedBox(height: 16),
            Text(
              "النتيجة: $realEstateResult",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }




  Widget _buildNormalCalculator() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                normalInput.isEmpty ? "0" : normalInput,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "النتيجة: $normalResult",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            GridView.count(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ...['7', '8', '9', '/'],
                ...['4', '5', '6', '*'],
                ...['1', '2', '3', '-'],
                ...['C', '0', '=', '+','⌫'],
                 // Add delete button
              ].map((buttonText) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                ),
                    padding: EdgeInsets.all(20),
                    backgroundColor:
                    buttonText == "=" ? Colors.orange : Colors.blue,
                    foregroundColor: Colors.white,

                  ),
                  onPressed: () {
                    if (buttonText == "C") {
                      clearNormalInput();
                    } else if (buttonText == "=") {
                      calculateNormal();
                    } else if (buttonText == "⌫") {
                      deleteLastCharacter();
                    } else {
                      appendToNormalInput(buttonText);
                    }
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 40),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
