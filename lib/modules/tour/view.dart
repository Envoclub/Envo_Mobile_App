import 'dart:developer';

import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:envo_mobile/modules/tour/controller.dart';
import 'package:envo_mobile/utils/meta_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../utils/meta_assets.dart';

class TourView extends StatefulWidget {
  @override
  State<TourView> createState() => _TourViewState();
}

class _TourViewState extends State<TourView> {
  bool start = false;
  @override
  Widget build(BuildContext context) {
    TourController controller = TourController.to;
    return Scaffold(
      appBar: AppBar(),
      body: !start
          ? Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  MetaAssets.logo,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TitleWidget(
                                title: "envo",
                                isLogo: true,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SubtitleWidget(
                                title: "Help Earth, Get Rewards"),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .1),
                        ],
                      ),
                    )),
                    CustomButton(
                        handler: () {
                          setState(() {
                            start = true;
                          });
                        },
                        label: "Let's Start")
                  ],
                ),
              ),
            )
          : Obx(() => PageView.builder(
              controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.tourPages.value!.length,
              itemBuilder: (context, pageIndex) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                controller.tourPages.value![pageIndex].title,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                  child: Image.asset(controller
                                      .tourPages.value![pageIndex].imageUrl)),
                              Obx(
                                () => Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.tourPages.value![pageIndex]
                                          .survey.value!.question,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Column(
                                    children: List.generate(
                                        controller.tourPages.value![pageIndex]
                                            .survey.value!.options.length,
                                        (index) => InkWell(
                                              onTap: () {
                                                controller
                                                    .tourPages
                                                    .value![pageIndex]
                                                    .survey
                                                    .value!
                                                    .selectionIndex = index;
                                                setState(() {});
                                              },
                                              child: Row(
                                                children: [
                                                  Radio(
                                                    fillColor: MaterialStateColor
                                                        .resolveWith((states) =>
                                                            MetaColors
                                                                .primaryColor),
                                                    value: index,
                                                    groupValue: controller
                                                        .tourPages
                                                        .value![pageIndex]
                                                        .survey
                                                        .value!
                                                        .selectionIndex,
                                                    onChanged: (selectedIndex) {
                                                      controller
                                                              .tourPages
                                                              .value![pageIndex]
                                                              .survey
                                                              .value!
                                                              .selectionIndex =
                                                          selectedIndex!;
                                                      setState(() {});
                                                    },
                                                  ),
                                                  Text(
                                                    controller
                                                        .tourPages
                                                        .value![pageIndex]
                                                        .survey
                                                        .value!
                                                        .options[index],
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ))),
                              )
                            ],
                          ),
                        ),
                        CustomButton(
                            handler: controller.handleNext, label: "Next")
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
