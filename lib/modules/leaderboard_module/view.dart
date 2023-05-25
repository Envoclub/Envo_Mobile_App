import 'package:envo_mobile/utils/meta_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/meta_colors.dart';

class LeaderBoardView extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Leaderboard",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .15,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.all(18.0).copyWith(bottom: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
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
                                child: Image.asset(
                                  MetaAssets.tourOne,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text("Sarthak"),
                            Text("12.8k")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: MetaColors.primaryColor,
                          child: Text(
                            "2",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Lottie.asset(MetaAssets.crownAsset,height: 10)),
                      Expanded(
                        child: Container(
                          height: double.maxFinite,
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
                          child: Image.asset(MetaAssets.tourOne),
                        ),
                      ),
                      Text("Sarthak"),
                      Text("12.8k")
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.all(18.0).copyWith(bottom: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
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
                                child: Image.asset(
                                  MetaAssets.tourOne,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text("Sarthak"),
                            Text("12.8k")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: MetaColors.primaryColor,
                          child: Text(
                            "3",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
