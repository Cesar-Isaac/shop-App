import 'package:flutter/material.dart';
import 'package:shop/core/style/repo.dart';

class RatingStars extends StatelessWidget {
  final double rating; 

  RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        double currentStar = index + 1;

        if (rating >= currentStar) {
          return Icon(Icons.star, color: StyleRepo.yellow, size: 25);
        } else if (rating > index && rating < currentStar) {
          return Icon(Icons.star_half, color: StyleRepo.yellow, size: 25);
        } else {
          return Icon(Icons.star_border, color: StyleRepo.lightGrey, size: 25);
        }
      }),
    );
  }
}
