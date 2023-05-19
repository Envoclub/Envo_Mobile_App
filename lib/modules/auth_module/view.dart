import 'package:envo_mobile/modules/auth_module/auth_screens/auth_screens.dart';
import 'package:envo_mobile/modules/auth_module/controller.dart';
import 'package:envo_mobile/modules/home/view.dart';
import 'package:envo_mobile/modules/tour/view.dart';
import 'package:envo_mobile/utils/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => controller.loading.value
        ? Scaffold(body: Loader())
        : !controller.isTourDone.value
            ? TourView()
            : controller.user.value != null
                ? HomeView()
                : AuthScreens());
  }
}
