import 'dart:convert';

import 'package:envo_mobile/models/survey_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TourPage {
  String imageUrl;
  Rxn<Survey> survey;
  String title;
  TourPage({
    required this.imageUrl,
    required this.survey,
    required this.title,
  });

  
}

