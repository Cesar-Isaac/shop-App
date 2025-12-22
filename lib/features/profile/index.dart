import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/profile/controller.dart';
import 'package:shop/features/profile/widgets/backGround_gradiant.dart';
import 'package:shop/features/profile/widgets/language_row.dart';
import 'package:shop/features/profile/widgets/language_sheet.dart';
import 'package:shop/features/profile/widgets/profile_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfilePageController>();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Gradient
          BackGroundGradient(screenHeight: screenHeight),

          // Main Body
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.25),
            padding: EdgeInsets.only(
              top: screenHeight * 0.10,
              left: screenWidth * 0.06,
              right: screenWidth * 0.06,
              bottom: screenHeight * 0.03,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenHeight * 0.05),
                topRight: Radius.circular(screenHeight * 0.05),
              ),
            ),
            child: Obx(() {
              // ===================== Loading =====================
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: StyleRepo.orange),
                );
              }

              // ===================== Error =====================
              if (controller.error.value.isNotEmpty) {
                return Center(
                  child: Text(
                    controller.error.value,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                );
              }

              final user = controller.currentUser.value;

              // ===================== No User =====================
              if (user == null) {
                return Center(
                  child: Text(
                    tr(LocaleKeys.user_not_found),
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: StyleRepo.darkGrey,
                    ),
                  ),
                );
              }

              // ===================== User Info =====================
              return ListView(
                children: [
                  // Name
                  Center(
                    child: Text(
                      "${user.name?.firstname} ${user.name?.lastname}",
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Row(
                    children: [
                      Icon(
                        Icons.phone_android_outlined,
                        color: StyleRepo.orange,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${tr(LocaleKeys.number)}: ${user.phone}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: StyleRepo.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Row(
                    children: [
                      Icon(Icons.pin_drop_outlined, color: StyleRepo.orange),
                      SizedBox(width: 10),
                      Text(
                        "${tr(LocaleKeys.address)}: ${user.address!.street}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: StyleRepo.darkGrey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Icon(Icons.email_outlined, color: StyleRepo.orange),
                      SizedBox(width: 10),
                      Text(
                        "${tr(LocaleKeys.email)}: ${user.email}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: StyleRepo.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Language Selection
                  InkWell(
                    onTap:
                        () => _showLanguageSheet(
                          context,
                          controller,
                          screenHeight,
                        ),
                    child: LanguageRow(
                      controller: controller,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.06),

                  // Logout
                  ElevatedButton(
                    onPressed: controller.logOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleRepo.orange,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: screenHeight * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenHeight * 0.02,
                        ),
                      ),
                    ),
                    child: Text(
                      tr(LocaleKeys.log_out),
                      style: TextStyle(
                        color: StyleRepo.white,
                        fontSize: screenHeight * 0.022,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),

          // Profile Avatar
          ProfileAvatar(screenHeight: screenHeight, screenWidth: screenWidth),
        ],
      ),
    );
  }

  // ===================== Helper Widgets =====================

  void _showLanguageSheet(
    BuildContext context,
    ProfilePageController controller,
    double screenHeight,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(screenHeight * 0.03),
        ),
      ),
      builder:
          (context) =>
              LanguageSheet(controller: controller, screenHeight: screenHeight),
    );
  }
}
