import 'package:envo_mobile/modules/auth_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
          child: Container(
            child: ListView(
              children: actions
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.back(result: e);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Text(e.name)),
                        ),
                      ))
                  .toList(),
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
