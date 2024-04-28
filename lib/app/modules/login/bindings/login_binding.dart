import 'package:get/get.dart';
import 'package:grocery_app/app/modules/login/controllers/login_controller.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInController>(
      () => LogInController(),
    );
  }
}
