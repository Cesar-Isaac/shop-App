import 'package:flutter/material.dart';
import 'package:shop/core/style/repo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StyleRepo.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      // height: MediaQuery.sizeOf(context).height * 0.1,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Sooq',
                    style: TextStyle(
                      color: StyleRepo.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
