import 'package:envo_mobile/modules/home/controller.dart';
import 'package:envo_mobile/modules/posts_module/bindings.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    PostBindings().dependencies();
  }
}
