
import 'package:flutter/material.dart';
import 'package:shop/core/style/repo.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * 0.18,
      left: screenWidth * 0.5 - (screenHeight * 0.07),
      child: CircleAvatar(
        radius: screenHeight * 0.07,
        backgroundColor: StyleRepo.lightOrange2,
        child: Icon(
          Icons.person,
          color: StyleRepo.orange,
          size: screenHeight * 0.07,
        ),
      ),
    );
  }
}
