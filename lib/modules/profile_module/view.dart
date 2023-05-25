import 'dart:ui';

import 'package:envo_mobile/modules/auth_module/auth_screens/auth_helper_widgets.dart';
import 'package:envo_mobile/modules/profile_module/controller.dart';
import 'package:envo_mobile/utils/meta_assets.dart';
import 'package:envo_mobile/utils/meta_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Scaffold(
            backgroundColor: Colors.white,
            extendBody: false,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(MetaAssets.dummProfile),
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                  pinned: true,
                  snap: true,
                  elevation: 0,
                  // pinned: true,
                  backgroundColor: Colors.white,
                  stretch: true,

                  // bottom: PreferredSize(
                  //   preferredSize: Size(80, 80),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: MetaColors.primaryColor,
                  //       borderRadius: BorderRadius.circular(12),
                  //       boxShadow: [
                  //         BoxShadow(
                  //             offset: Offset(5, 10),
                  //             color: MetaColors.secondaryColor.withOpacity(0.1),
                  //             blurRadius: 10)
                  //       ],
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Column(
                  //           children: [Text("My Coins"), Text("10000")],
                  //         ),
                  //         VerticalDivider(),
                  //         Column(
                  //           children: [Text("My Coins"), Text("10000")],
                  //         ),
                  //         VerticalDivider(),
                  //         Column(
                  //           children: [Text("My Coins"), Text("10000")],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  expandedHeight: 300,
                  floating: true, automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1.2,
                    titlePadding: EdgeInsets.only(left: 0, bottom: 0),
                    title: SizedBox(
                      height: 60,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(3.0).copyWith(bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Saransh Hasija",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    background: DecoratedBox(
                        position: DecorationPosition.foreground,
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          MetaAssets.dummProfile,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                SliverAppBar(
                    collapsedHeight: 100,
                    automaticallyImplyLeading: false,
                    // pinned: true,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.zero,
                      title: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MetaColors.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 10),
                                  color: MetaColors.secondaryColor
                                      .withOpacity(0.1),
                                  blurRadius: 10)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "10000",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "My Coins",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: VerticalDivider(
                                    thickness: 1.5,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "42K",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "Eco Actions",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: VerticalDivider(
                                    thickness: 1.5,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "1kG",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "cO2 saved",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recent Actions",
                      style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverAnimatedGrid(
                      initialItemCount: 20,
                      itemBuilder: (context, index, value) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: MetaColors.levelTwoColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(child: Text("Image")),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8, crossAxisCount: 2)),
                )
              ],
            )));

    // SingleChildScrollView(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Stack(
    //         children: [Image.asset(MetaAssets.tourOne)],
    //       )

    // Center(
    //   child: CircleAvatar(
    //     backgroundColor: MetaColors.primaryColor,
    //     radius: 50,
    //   ),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Text("Saransh Hasija",
    //       style: GoogleFonts.poppins(
    //         fontSize: 20,
    //         fontWeight: FontWeight.w700,
    //       )),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8.0).copyWith(top: 0),
    //   child: Text("saransh@envo.club",
    //       style: GoogleFonts.poppins(
    //         color: MetaColors.tertiaryTextColor,
    //         fontSize: 10,
    //         fontWeight: FontWeight.w400,
    //       )),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(
    //               offset: Offset(5, 10),
    //               color: MetaColors.primaryColor.withOpacity(0.1),
    //               blurRadius: 10)
    //         ],
    //         borderRadius: BorderRadius.circular(10),
    //         border: Border.all(
    //             color: MetaColors.primaryColor.withOpacity(0.9),
    //             width: 1)),
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text("My Coins",
    //                     style: GoogleFonts.poppins(
    //                       color: MetaColors.tertiaryTextColor,
    //                       fontSize: 15,
    //                       fontWeight: FontWeight.w600,
    //                     ))),
    //           ),
    //           Row(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(15),
    //                 child: Image.asset(
    //                   MetaAssets.logo,
    //                   height: 30,
    //                   width: 30,
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 8,
    //               ),
    //               Text("200",
    //                   style: GoogleFonts.monda(
    //                     color: Colors.black,
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.w600,
    //                   ))
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //             offset: Offset(5, 10),
    //             color: MetaColors.primaryColor.withOpacity(0.1),
    //             blurRadius: 10)
    //       ],
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Text("Refer a friend",
    //                         style: GoogleFonts.poppins(
    //                           color: MetaColors.tertiaryTextColor,
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.w600,
    //                         ))),
    //               ),
    //               Icon(
    //                 Icons.arrow_circle_right_outlined,
    //                 color: MetaColors.primaryColor,
    //               )
    //             ],
    //           ),
    //           Divider(
    //             color: MetaColors.secondaryColor,
    //             indent: 10,
    //             endIndent: 10,
    //           ),
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Text("History",
    //                         style: GoogleFonts.poppins(
    //                           color: MetaColors.tertiaryTextColor,
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.w600,
    //                         ))),
    //               ),
    //               Icon(
    //                 Icons.arrow_circle_right_outlined,
    //                 color: MetaColors.primaryColor,
    //               )
    //             ],
    //           ),
    //           Divider(
    //             color: MetaColors.secondaryColor,
    //             indent: 10,
    //             endIndent: 10,
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // CustomButton(handler: () {}, label: "Log Out")
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
