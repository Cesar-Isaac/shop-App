import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/core/widgets/image.dart';

const double _kAspectRatio = 16 / 9;

class AdsWidget extends StatelessWidget {
  AdsWidget({super.key});

  final Rx<int> _currentAd = 0.obs;
  int get currentAd => _currentAd.value;
  set currentAd(int value) => _currentAd.value = value;

  @override
  Widget build(BuildContext context) {
    List ads = [
      'assets/image/image1.jpg',
      'assets/image/image2.jpg',
      'assets/image/image3.jpg',
      'assets/image/image4.jpg',
      'assets/image/image5.jpg',
    ];
    return Column(
      children: [
        CarouselSlider(
          
          options: CarouselOptions(
            onPageChanged: (index, _) => currentAd = index,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: _kAspectRatio,
          ),
          items: List.generate(
            ads.length,
            (index) => AspectRatio(
              aspectRatio: _kAspectRatio,
              child: AppImage(
                errorWidget: Icon(Icons.wifi_off_outlined,color: StyleRepo.orange,),
                width: double.infinity,
                path: ads[index],
                type: ImageType.Asset,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              ads.length,
              (index) => Obx(
                () => AnimatedContainer(
                  duration: 300.milliseconds,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: currentAd == index ? 12 : 6,
                  width: currentAd == index ? 12 : 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentAd == index
                        ? StyleRepo.orange
                        : StyleRepo.lightGrey,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
