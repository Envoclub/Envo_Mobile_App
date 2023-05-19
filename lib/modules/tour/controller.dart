import 'package:envo_mobile/models/survey_model.dart';
import 'package:envo_mobile/modules/auth_module/controller.dart';
import 'package:envo_mobile/utils/meta_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/tour_page_model.dart';

class TourController extends GetxController {
  static TourController to = Get.find<TourController>();
  PageController pageController = PageController();
  Rxn<List<TourPage>> tourPages = Rxn([
    TourPage(
        imageUrl: MetaAssets.tourOne,
        survey: Rxn(Survey(
            question: "Which statement is most accurate for you?",
            selectionIndex: 0,
            options: [
              "I live in an energy efficient building",
              "I live in an energy efficient building",
              "I live in a normal building."
            ])),
        title: "Lets do it Together"),
    TourPage(
        imageUrl: MetaAssets.tourTwo,
        survey: Rxn(Survey(
            question: "Which Means of transport do you use for travelling ?",
            selectionIndex: 0,
            options: [
              "I almost always go by public transport.",
              "I almost always go by  cycle or by walk.",
              "I almost always drive by car."
            ])),
        title: "Lets do it Together"),
    TourPage(
        imageUrl: MetaAssets.tourOne,
        survey: Rxn(Survey(
            question: "Which statement is most accurate for you?",
            selectionIndex: 0,
            options: [
              "I only eat vegetarian food.",
              "I eat meat 2 to 3 times a week.",
              "I eat meat almost every day."
            ])),
        title: "Lets do it Together")
  ]);

  void onChanged(int? value) {}

  void handleNext() {
    if (pageController.page == tourPages.value!.length - 1) {
      AuthController.to.completeTour();
    } else {
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }
}
