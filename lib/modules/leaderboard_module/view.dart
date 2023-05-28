import 'package:envo_mobile/utils/meta_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
          TopThreeWidget(),
          SizedBox(
            height: 30,
          ),
          MyRankTile(),
          Expanded(
              child: ListView(
            children: [
              LeaderboardTile(),
              LeaderboardTile(),
              LeaderboardTile(),
              LeaderboardTile(),
              LeaderboardTile(),
              LeaderboardTile(),
            ],
          ))
        ],
      ),
    );
  }
}

class MyRankTile extends StatelessWidget {
  const MyRankTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        color: MetaColors.secondaryColor.withOpacity(0.1),
                        blurRadius: 10)
                  ],
                  border: Border.all(
                      width: 2,
                      color: MetaColors.secondaryColor.withOpacity(0.8)),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("25"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MetaColors.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your current rank ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("12.9k Actions",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  MetaAssets.logo,
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("200",
                              style: GoogleFonts.monda(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: MetaColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        color: MetaColors.secondaryColor.withOpacity(0.1),
                        blurRadius: 10)
                  ],
                  border: Border.all(
                      width: 2, color: Colors.white.withOpacity(0.8)),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "25",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saransh",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("12.9k Actions",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  MetaAssets.logo,
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("200",
                              style: GoogleFonts.monda(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopThreeWidget extends StatelessWidget {
  const TopThreeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 10),
                  color: MetaColors.primaryColor.withOpacity(0.1),
                  blurRadius: 10)
            ],
            color: MetaColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * .2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.all(18.0).copyWith(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 30,
                                child: Lottie.asset(MetaAssets.crownAsset,
                                    height: 10)),
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
                            Text(
                              "Sarthak",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "12.8k",
                              style: TextStyle(
                                  color: MetaColors.tertiaryTextColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500),
                            ),
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
              ),
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30,
                          child:
                              Lottie.asset(MetaAssets.crownAsset, height: 10)),
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
                      Text(
                        "Sarthak",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "12.8k",
                        style: TextStyle(
                            color: MetaColors.tertiaryTextColor,
                            fontSize: 8,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.all(18.0).copyWith(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 30,
                                child: Lottie.asset(MetaAssets.crownAsset,
                                    height: 10)),
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
                            Text(
                              "Sarthak",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "12.8k",
                              style: TextStyle(
                                  color: MetaColors.tertiaryTextColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500),
                            ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
