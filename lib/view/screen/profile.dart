
import 'package:flutter/material.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../widget/profile_widget.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          bottom: 10, start: 25, end: 25),
      child: Container(
        // color: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 70),
                decoration: BoxDecoration(
                    color: ProjectColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: ProjectColors.greyColor
                              .withOpacity(0.5),
                          offset: Offset.zero,
                          blurRadius: 4,
                          spreadRadius: 4)
                    ]),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'الملف الشخصي',
                      style: TextStyles.font18BlackBold,
                    ),
                    Text(
                      'ali@gmail.com',
                      style: TextStyles.font18GreyW400,
                    ),
                    ListItemAllInProfile(),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 12,
                child: ShowImageInProfile(

                )),
          ],
        ),
      ),
    );
  }
}

