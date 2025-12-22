
import 'package:flutter/material.dart';
import 'package:shop/core/style/repo.dart';

class BackGroundGradient extends StatelessWidget {
  const BackGroundGradient({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            StyleRepo.darkedOrang,
            StyleRepo.orange,
            StyleRepo.lightOrange,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
