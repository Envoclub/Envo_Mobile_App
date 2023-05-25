import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_slider.dart';
import '../../utils/meta_assets.dart';
import '../../utils/meta_colors.dart';

class RewardsView extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Rewards",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(RewardDetailedView());
                },
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 10),
                            color: MetaColors.secondaryColor.withOpacity(0.1),
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Hero(
                        tag: 'image',
                        child: Image.asset(
                          MetaAssets.rewardImage,
                          fit: BoxFit.fill,
                          width: double.maxFinite,
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "H&M Eco Sandals",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "12k people claimed this Item",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: MetaColors.tertiaryTextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    MetaAssets.logo,
                                    height: 15,
                                    width: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("200",
                                    style: GoogleFonts.monda(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              SliderTheme(
                                data: Get.theme.sliderTheme
                                    .copyWith(thumbShape: SliderThumbImage()),
                                child: Slider(
                                    activeColor: MetaColors.primaryColor,
                                    thumbColor: MetaColors.primaryColor,
                                    value: 0.8,
                                    onChanged: (val) {}),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(8.0).copyWith(top: 0),
                                child: Text(
                                  "160/200",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MetaColors.tertiaryTextColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 10),
                                    color: MetaColors.secondaryColor
                                        .withOpacity(0.1),
                                    blurRadius: 10)
                              ],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: MetaColors.secondaryColor
                                      .withOpacity(0.2))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RewardDetailedView extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'image',
                    child: Container(
                      height: MediaQuery.of(context).size.height * .4,
                      child: Image.asset(
                        MetaAssets.rewardImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "H&M Eco Sandals",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "12k people claimed this Item",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MetaColors.tertiaryTextColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                MetaAssets.logo,
                                height: 15,
                                width: 15,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("200",
                                style: GoogleFonts.monda(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          SliderTheme(
                            data: Get.theme.sliderTheme
                                .copyWith(thumbShape: SliderThumbImage()),
                            child: Slider(
                                activeColor: MetaColors.primaryColor,
                                thumbColor: MetaColors.primaryColor,
                                value: 0.8,
                                onChanged: (val) {}),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                            child: Text(
                              "160/200",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: MetaColors.tertiaryTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 10),
                                color:
                                    MetaColors.secondaryColor.withOpacity(0.1),
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color:
                                  MetaColors.secondaryColor.withOpacity(0.2))),
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomButton(handler: () {}, label: "Redeem")
        ],
      ),
    );
  }
}
