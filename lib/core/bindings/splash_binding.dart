import 'package:get/get.dart';
import 'package:sonus/features/splash/splash_controller.dart';

class SplashBinding implements Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    Get.lazyPut(() => SplashController());

    return [];
  }
}
