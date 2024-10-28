import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvc_or_mvvm_pattern/view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashView,
          page: () => const SplashView(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 300),
        ),
      ];
}
