import 'package:envo_mobile/modules/create_post/controller.dart';
import 'package:get/get.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(CreatePostController());
  }
}
