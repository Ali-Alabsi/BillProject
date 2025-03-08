
import 'package:flutter/material.dart';

class TestCir extends StatelessWidget {
  const TestCir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestCir'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Container(
          height: 400,
          color: Colors.blue,
          child: Center(
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,

                  ),
                ),
                Positioned(
                  top: -20,
                  left: 50,
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
