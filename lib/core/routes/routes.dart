// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/auth/log_in/index.dart';
import 'package:shop/features/auth/register/index.dart';
import 'package:shop/features/products/all_product/index.dart';
import 'package:shop/features/products/product_details/index.dart';
import 'package:shop/features/splash_screen/index.dart';


import '../../features/main/index.dart';


class AppRouting {
  static GetPage unknownRoute =
      GetPage(name: "/unknown", page: () => SizedBox());

  static GetPage initialRoute = GetPage(
    name: "/",
    page: () => SplashScreen(),
  );

  static List<GetPage> routes = [
    initialRoute,
    ...Pages.values.map((e) => e.page),
  ];
}

enum Pages {
  //Auth
  login,
  register,
  //
  home,
  all_product,
  products_details,
  //
  ;

  String get value => '/$name';

  GetPage get page => switch (this) {
        login => GetPage(
            name: value,
            page: () => LoginPage(),
          ),
        register => GetPage(
            name: value,
            page: () => RegisterPage(),
          ),
        home => GetPage(
            name: value,
            page: () => MainPage(),
          ),
        all_product => GetPage(
            name: value,
            page: () => AllProductPage(),
          ),
        products_details => GetPage(
          name: value,
           page: ()=> ProductDetails()
           )  

      };
}
