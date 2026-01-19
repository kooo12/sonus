import 'package:get/get.dart';
import 'package:sonus/core/bindings/home_binding.dart';
import 'package:sonus/core/bindings/splash_binding.dart';
import 'package:sonus/features/home/home.dart';
import 'package:sonus/features/splash/splash.dart';
import 'package:sonus/routhing/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
  ];
}
