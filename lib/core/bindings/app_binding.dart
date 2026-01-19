import 'package:get/get.dart';
import 'package:sonus/core/controllers/app_controller.dart';
import 'package:sonus/core/services/network_manager.dart';

class AppBinding implements Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    Get.put(AppController(), permanent: true);
    Get.put(NetworkManager(), permanent: true);
    return [];
  }
}
