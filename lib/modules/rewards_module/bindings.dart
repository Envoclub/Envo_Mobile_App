import 'package:com.benignapp/modules/rewards_module/controller.dart';
import 'package:get/get.dart';

class RewardsBiding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RewardsController());
  }
}
