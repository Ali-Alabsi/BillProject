
import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/text_styles.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const MainButton({
    super.key, required this.text, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColors.mainColor,
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        child: Text(
          text,
          style: TextStyles.font18whiteW600,
        ));
  }
}