import 'package:flutter/material.dart';

import '../shared/colors.dart';
import 'loading_in_dicator.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading; // Controls visibility

  const LoadingWidget({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
          height: double.infinity,
          width: double.infinity,
      alignment: Alignment.center,
          child: Container(
              height: 60,
              width: 60,

              decoration: BoxDecoration(
                color: ProjectColors.mainColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: LoadingIndicator(

                ),
              ),
            ),
        )
        : const SizedBox.shrink(); // Hide when not loading
  }
}
