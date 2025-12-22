import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/core/services/rest_api/api_service.dart';
import 'package:shop/core/style/style.dart';

import 'core/config/app_builder.dart';
import 'core/localization/localization.dart';
import 'core/services/rest_api/fake_api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  final storage = GetStorage();
  final savedLangCode = storage.read('languageCode') ?? 'en';
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.values.map((e) => e.locale).toList(),
      path: "assets/translations",
      fallbackLocale: AppLocalization.en.locale,
      startLocale: Locale(savedLangCode),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AppBuilder());
    Get.put(APIService());
    Get.put(FakeStoreService());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: AppStyle.theme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      //
      initialRoute: '/',
      unknownRoute: AppRouting.unknownRoute,
      getPages: AppRouting.routes,
    );
  }
}