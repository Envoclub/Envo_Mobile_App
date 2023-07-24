import 'package:com.benignapp/modules/home/controller.dart';
import 'package:com.benignapp/modules/leaderboard_module/binding.dart';
import 'package:com.benignapp/modules/posts_module/bindings.dart';
import 'package:com.benignapp/modules/profile_module/binding.dart';
import 'package:com.benignapp/modules/rewards_module/bindings.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    PostBindings().dependencies();
    ProfileBinding().dependencies();
    LeaderboardBinding().dependencies();
    RewardsBiding().dependencies();
  }
}
