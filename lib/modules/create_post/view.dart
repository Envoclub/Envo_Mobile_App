import 'dart:io';

import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../utils/meta_colors.dart';
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
                  color: Colors.black,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: controller.image.value != null
                      ? controller.pickVideo
                          ? Container(
                              child: AspectRatio(
                                aspectRatio:
                                    MediaQuery.of(context).size.aspectRatio,
                                child: controller.controller.value != null
                                    ? Obx(() => VideoPlayer(
                                        controller.controller.value!))
                                    : SizedBox.shrink(),
                              ),
                            )
                          : Image.file(
                              File(controller.image.value!.path),
                            )
                      : SizedBox.shrink(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Obx(() => Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        controller.selectedAction.value != null
                                            ? controller.selectedAction.value!
                                                    .action ??
                                                ''
                                            : "",
                                        style: GoogleFonts.sourceCodePro(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Icon(
                                    CupertinoIcons.tree,
                                    color: MetaColors.secondaryGradient,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    CustomButton(
                        loading: controller.loading.value,
                        handler: controller.handlePost,
                        label: "Post")
                  ],
                )
              ],
            )),
      ),
    );
  }
}
