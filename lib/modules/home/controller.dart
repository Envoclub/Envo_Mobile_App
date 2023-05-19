import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find<HomeController>();
  Rxn<int> currentIndex=Rxn(0);
}
