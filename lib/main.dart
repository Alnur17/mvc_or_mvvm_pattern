import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/getx%20localization/languages.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVC/MVVM Pattern',
      translations: Languages(),
      locale: const Locale('er', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const SplashView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}


