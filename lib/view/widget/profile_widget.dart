import 'package:flutter/material.dart';
import 'package:project_bills/controller/login_controller/login_cubit.dart';
import 'package:project_bills/core/widget/awesome_dialog.dart';
import 'package:project_bills/view/screen/contact_us.dart';
import 'package:project_bills/view/screen/privacy_policy.dart';

import '../../core/app_routes.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../screen/edit_profile.dart';
import '../screen/notification.dart';

class ListItemAllInProfile extends StatelessWidget {
  const ListItemAllInProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ItemListInProfile(
              name: 'تعديل الحساب',
              icon: Icons.account_circle_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
            ),
            ItemListInProfile(
              name: 'اشعارات الفواتير',
              icon: Icons.notifications_none,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
            ItemListInProfile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
              name: 'توصل معنا',
              icon: Icons.call_outlined,
            ),
            ItemListInProfile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                );
              },
              name: 'سياسة الخصوصية',
              icon: Icons.email_outlined,
            ),
            ItemListInProfile(
              onTap: () {
                AwesomeDialogFunction.awesomeDialogQuestion(
                    context, 'تسجيل الخروج', 'هل انت متاكد انك تريد تسجيل الخروج ؟', () {
                      LoginCubit.get(context).logout();
                      Navigator.pushNamed(context, AppRoutes.login);
                }, () {});
              },
              name: 'تسجيل الخروج',
              icon: Icons.power_settings_new,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListInProfile extends StatelessWidget {
  final String name;
  final String? nameLang;
  final IconData icon;
  final Widget? darkIcon;
  final Function()? onTap;

  const ItemListInProfile({
    super.key,
    required this.name,
    required this.icon,
    this.nameLang,
    this.darkIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$name',
                  style: TextStyles.font14BlackBold,
                ),
              ],
            ),
            Row(
              children: [
                nameLang != null
                    ? Text(
                        '$nameLang',
                        style: TextStyles.font16mainColorBold,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 8,
                ),
                Directionality(
                    textDirection: TextDirection.ltr,
                    child: darkIcon ?? Icon(Icons.arrow_back_ios_new_sharp)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShowImageInProfile extends StatelessWidget {
  const ShowImageInProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: Image.asset('assets/images/logo.png').image,
              // child: Icon(
              //   Icons.account_circle,
              //   size: 140,
              //   color: ProjectColors.mainColor,
              // ),
            ),
            radius: 75,
            backgroundColor: ProjectColors.mainColor,
          ),
          // Positioned(
          //   bottom: 5,
          //   right: 5,
          //   child: InkWell(
          //     onTap: () {
          //       ImagePicker()
          //           .pickImage(source: ImageSource.camera)
          //           .then((value) {
          //         print('Upload Image Is Success');
          //       });
          //     },
          //     child: Container(
          //       padding: EdgeInsetsDirectional.all(4),
          //       child: Icon(
          //         Icons.image_outlined,
          //         color: ProjectColors.mainColor,
          //       ),
          //       decoration: BoxDecoration(
          //           color: ProjectColors.whiteColor,
          //           borderRadius: BorderRadius.circular(10),
          //           border:
          //               Border.all(color: ProjectColors.mainColor, width: 3)),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
