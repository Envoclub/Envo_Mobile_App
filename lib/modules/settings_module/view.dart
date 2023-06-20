import 'package:cached_network_image/cached_network_image.dart';
import 'package:envo_mobile/modules/auth_module/controller.dart';
import 'package:envo_mobile/modules/profile_module/controller.dart';
import 'package:envo_mobile/utils/meta_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/meta_colors.dart';
import '../auth_module/auth_screens/auth_helper_widgets.dart';

class SettingsView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(controller.data.value?.photoUrl??''),
                  radius: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(controller.data.value?.username??'',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                child: Text(controller.data.value?.email??'',
                    style: TextStyle(
                      color: MetaColors.tertiaryTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 10),
                            color: MetaColors.primaryColor.withOpacity(0.1),
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: MetaColors.primaryColor.withOpacity(0.9),
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("My Coins",
                                      style: TextStyle(
                                        color: MetaColors.tertiaryTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ))),
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    MetaAssets.logo,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(controller.data.value!.coins.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 10),
                          color: MetaColors.primaryColor.withOpacity(0.1),
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Invite your Colleague",
                                      style: TextStyle(
                                        color: MetaColors.tertiaryTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ))),
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: MetaColors.primaryColor,
                            )
                          ],
                        ),
                        Divider(
                          color: MetaColors.secondaryColor,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("History",
                                      style: TextStyle(
                                        color: MetaColors.tertiaryTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ))),
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: MetaColors.primaryColor,
                            )
                          ],
                        ),
                        Divider(
                          color: MetaColors.secondaryColor,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Reset Password",
                                      style: TextStyle(
                                        color: MetaColors.tertiaryTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ))),
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: MetaColors.primaryColor,
                            )
                          ],
                        ),
                        Divider(
                          color: MetaColors.secondaryColor,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Help",
                                      style: TextStyle(
                                        color: MetaColors.tertiaryTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ))),
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: MetaColors.primaryColor,
                            )
                          ],
                        ),
                        Divider(
                          color: MetaColors.secondaryColor,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(handler: () {
                AuthController.to.logout();
                Get.back();
              }, label: "Log Out")
            ],
          ),
        ),
      ),
    );
  }
}
