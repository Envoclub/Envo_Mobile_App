import 'package:com.benignapp/modules/settings_module/controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SettingsController());
  }
}
