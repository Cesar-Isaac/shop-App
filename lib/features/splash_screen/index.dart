import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/splash_screen/controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller =
        Get.put(SplashController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color:  StyleRepo.orange,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: controller.rotation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: controller.rotation.value,
                          child: child,
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.local_grocery_store,
                          color: StyleRepo.orange,
                          size: 50,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Sooq",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: StyleRepo.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
