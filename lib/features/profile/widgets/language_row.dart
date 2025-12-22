import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/core/widgets/svg_icon.dart';
import 'package:shop/features/profile/controller.dart';
import 'package:shop/gen/assets.gen.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({
    super.key,
    required this.controller,
    required this.screenHeight,
    required this.screenWidth,
  });

  final ProfilePageController controller;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgIcon(
              icon: Assets.icons.language,
              color: StyleRepo.orange,
              size: screenHeight * 0.03,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              tr(LocaleKeys.Language),
              style: TextStyle(
                color: StyleRepo.darkGrey,
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              Get.locale?.languageCode == "ar" ? "العربية" : "English",
              style: TextStyle(
                color: StyleRepo.darkGrey,
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Icon(
              Icons.arrow_forward_ios,
              color: StyleRepo.darkGrey,
              size: screenHeight * 0.025,
            ),
          ],
        ),
      ],
    );
  }
}
