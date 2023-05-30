import 'package:envo_mobile/modules/auth_module/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/meta_colors.dart';

class CreatePostController extends GetxController {
  static CreatePostController to = Get.find<CreatePostController>();
  ImagePicker picker = ImagePicker();
  Rxn<XFile?> image = Rxn();
  Rxn<Action?> selectedAction = Rxn();
  List<Action> actions = [
    Action(name: "Plant A tree", id: "1"),
    Action(name: "CarPool", id: "2")
  ];

  getImage() async {
    try {
      image.value = await picker.pickImage(source: ImageSource.camera);
      if (image.value != null) {
        selectedAction.value = await Get.dialog<Action>(Material(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Which eco-action did you take?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: actions
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.back(result: e);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: MetaColors.primaryColor
                                                    .withOpacity(0.1),
                                                spreadRadius: 5,
                                                offset: Offset(0, 5),
                                                blurRadius: 10)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons.tree,
                                                size: 80,
                                                color: MetaColors
                                                    .secondaryGradient,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                e.name,
                                                style:
                                                    GoogleFonts.sourceCodePro(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImage();
  }

  void handlePost() async {}
}

class Action {
  String name;
  String id;
  Action({required this.name, required this.id});
}
