// ملف widgets/language_sheet.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/style/repo.dart';
import '../controller.dart';

class LanguageSheet extends StatelessWidget {
  final ProfilePageController controller;
  final double screenHeight;

  const LanguageSheet({
    super.key,
    required this.controller,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    final languages = [
      {'name': 'English', 'code': 'en'},
      {'name': 'Arabic', 'code': 'ar'},
    ];

    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr(LocaleKeys.Language), 
                style: TextStyle(
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w600,
                  color: StyleRepo.darkGrey,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: StyleRepo.darkGrey,
                  size: screenHeight * 0.03,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          ...languages.map(
            (lang) => ListTile(
              title: Text(
                lang['name']!,
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
              onTap: () {
                controller.changeLanguage(lang['code']!, context);
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
