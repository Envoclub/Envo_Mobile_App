import 'dart:convert';

import 'package:com.benignapp/models/survey_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TourPage {
  String imageUrl;
  Rxn<Survey> survey;
  String title;
  String? suffix;
  TourPage(
      {required this.imageUrl,
      required this.survey,
      required this.title,
      this.suffix});
}
