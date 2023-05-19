import 'dart:developer';
import 'dart:ui';

import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:envo_mobile/modules/home/controller.dart';
import 'package:envo_mobile/utils/helper_widgets.dart';
import 'package:envo_mobile/utils/meta_assets.dart';
import 'package:envo_mobile/utils/meta_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_painter.dart';
import '../../utils/custom_slider.dart';
import '../posts_module/view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          leadingWidth: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: MetaColors.primaryColor,
                  radius: 15,
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: "Hi ",
                      style: GoogleFonts.sourceCodePro(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MetaColors.secondaryColor),
                      children: [
                    TextSpan(
                        text: "Saransh",
                        style: GoogleFonts.sourceCodePro(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: MetaColors.secondaryColor))
                  ])),
            ],
          )),
      bottomNavigationBar: ClipRRect(child: CustomBottomNav()),
      body: Obx(
        () {
          return HomeController.to.currentIndex.value == 0
              ? Center(
                  child: Container(child: PostsView()),
                )
              : Center(child: FootPrintsScreen());
        },
      ),
    );
  }
}

class FootPrintsScreen extends StatefulWidget {
  const FootPrintsScreen({
    super.key,
  });

  @override
  State<FootPrintsScreen> createState() => _FootPrintsScreenState();
}

class _FootPrintsScreenState extends State<FootPrintsScreen> {
  PictureInfo? svg;
  @override
  void initState() {
    getData();
  }

  getData() async {
    final PictureInfo pictureInfo = await vg.loadPicture(
        SvgPicture.asset(
          MetaAssets.activeFeet,
          colorFilter: ColorFilter.mode(Colors.red, BlendMode.src),
        ).bytesLoader,
        null);
    setState(() {
      svg = pictureInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: svg == null
              ? Loader()
              : Container(
                  height: 600,
                  width: 600,
                  child: CustomPaint(
                    painter: CurvePainter(svg!),
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      MetaAssets.home,
      MetaAssets.market,
      MetaAssets.footprint,
      MetaAssets.profile,
    ];
    return Obx(
      () {
        log(HomeController.to.currentIndex.value.toString());
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: MetaColors.primaryColor.withOpacity(0.7)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  icons.length,
                  (index) => InkWell(
                    onTap: () {
                      HomeController.to.currentIndex.value = index;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 200),
                        child: SvgPicture.asset(
                          icons[index],
                          height: HomeController.to.currentIndex.value == index
                              ? 25
                              : 18,
                          colorFilter: ColorFilter.mode(
                              HomeController.to.currentIndex.value == index
                                  ? Colors.white
                                  : Colors.white54,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
