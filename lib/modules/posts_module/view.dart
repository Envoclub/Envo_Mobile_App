import 'package:envo_mobile/modules/posts_module/controller.dart';
import 'package:envo_mobile/utils/helper_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_slider.dart';
import '../../utils/meta_assets.dart';
import '../../utils/meta_colors.dart';

class PostsView extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Obx(
      () => !controller.loading.value!
          ? Center(
              child: Loader(),
            )
          : Scaffold(
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
              body: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: PageView(
                  padEnds: false,
                  controller: controller.pageController,
                  scrollDirection: Axis.vertical,
                  children: [
                    PostTile(),
                    PostTile(),
                    PostTile(),
                  ],
                ),
              ),
            ),
    );
  }
}

class PostTile extends StatefulWidget {
  const PostTile({
    super.key,
  });

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Rxn<double> value = Rxn(0.0);
    RxBool enabled = true.obs;
    return ScaleTransition(
      scale:
          CurvedAnimation(parent: _animationController!, curve: Curves.easeIn),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: MetaColors.primaryColor.withOpacity(0.1),
                    spreadRadius: 5,
                    offset: Offset(0, 5),
                    blurRadius: 10)
              ]),
          child: Center(
              child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: MetaColors.primaryColor,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saransh",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Level 2",
                            style: GoogleFonts.montserrat(
                                color: MetaColors.tertiaryTextColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: Image.asset(MetaAssets.tourOne)),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 10),
                            color: MetaColors.secondaryColor.withOpacity(0.1),
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: MetaColors.secondaryColor.withOpacity(0.2))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.hand_draw_fill,
                              color: Colors.amberAccent,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0)
                                  .copyWith(top: 0, bottom: 0),
                              child: Text(
                                "45k",
                                style: GoogleFonts.monoton(
                                    color: MetaColors.secondaryColor,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      Obx(() => Expanded(
                              child: SliderTheme(
                            data: Get.theme.sliderTheme
                                .copyWith(thumbShape: SliderThumbImage()),
                            child: Slider(
                                activeColor: MetaColors.primaryColor,
                                thumbColor: MetaColors.primaryColor,
                                value: value.value!,
                                onChanged: (val) {
                                  if (enabled.value) value.value = val;
                                }),
                          )))
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.white,
                      MetaColors.secondaryGradient
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.tree,
                        color: MetaColors.secondaryGradient,
                      ),
                      Text(
                        "Planted a tree",
                        style: GoogleFonts.sourceCodePro(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
