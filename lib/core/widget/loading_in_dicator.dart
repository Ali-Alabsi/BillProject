import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  final double size;
  final SpinkitType type;

  const LoadingIndicator({
    super.key,
    this.color = Colors.white,
    this.size = 32.0,
    this.type = SpinkitType.fadingCircle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _getSpinner(),
    );
  }


  Widget _getSpinner() {
    switch (type) {
      case SpinkitType.circle:
        return SpinKitCircle(color: color, size: size);
      case SpinkitType.doubleBounce:
        return SpinKitDoubleBounce(color: color, size: size);
      case SpinkitType.wanderingCubes:
        return SpinKitWanderingCubes(color: color, size: size);
      case SpinkitType.wave:
        return SpinKitWave(color: color, size: size);
      default:
        return SpinKitFadingCircle(color: color, size: size);
    }
  }
}

enum SpinkitType {
  circle,
  doubleBounce,
  wanderingCubes,
  wave,
  fadingCircle,
}
// LoadingIndicator(
// color: Colors.red,  // لون التحميل
// size: 10,           // حجم العنصر
// type: SpinkitType.wave, // نوع التحميل
// ),