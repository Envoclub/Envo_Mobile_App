import 'dart:developer';
import 'dart:ui';

import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:envo_mobile/modules/tour/controller.dart';
import 'package:envo_mobile/utils/meta_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

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
              child: Stack(
                children: [
                  DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                          gradient: RadialGradient(
                              radius: 1.5,
                              colors: [Colors.transparent, Colors.black87])),
                      child: SplashVideo()),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        .05),
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
                                    Text(
                                      "envo",
                                      style: GoogleFonts.poppins(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Help Earth, Get Rewards",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .1),
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
                  ),
                ],
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Image.asset(controller
                                        .tourPages.value![pageIndex].imageUrl),
                                  )),
                              Obx(
                                () => Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0).copyWith(bottom: 20),
                                    child: Text(
                                      controller.tourPages.value![pageIndex]
                                          .survey.value!.question,
                                      style: TextStyle(
                                          fontSize: 25,
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
                                                        TextStyle(fontSize: 15),
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

class SplashVideo extends StatefulWidget {
  @override
  _SplashVideoState createState() => _SplashVideoState();
}

class _SplashVideoState extends State<SplashVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(MetaAssets.splashVideo);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(_controller),
            ],
          ),
        ),
      ),
    );
  }
}
