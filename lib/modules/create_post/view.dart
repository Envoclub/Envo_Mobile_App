import 'dart:io';

import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class CreatePostView extends GetView<CreatePostController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Obx(() => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: controller.image.value != null
                      ? Image.file(File(controller.image.value!.path),fit: BoxFit.fill,)
                      : SizedBox.shrink(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Obx(() => Text(
                              controller.selectedAction.value != null
                                  ? controller.selectedAction.value!.name
                                  : "")),
                        ),
                      ),
                    ),
                    CustomButton(handler: controller.handlePost, label: "Post")
                  ],
                )
              ],
            )),
      ),
    );
  }
}
