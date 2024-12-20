import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvc_or_mvvm_pattern/view/login/login_view.dart';
import 'package:mvc_or_mvvm_pattern/view/register/register_view.dart';
import 'package:mvc_or_mvvm_pattern/view/splash_view.dart';

import '../../view/home/home_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashView,
          page: () => const SplashView(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.loginView,
          page: () => const LoginView(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
    GetPage(
      name: RoutesName.registerView,
      page: () => const RegisterView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutesName.homeView,
      page: () => const HomeView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
      ];
}
