// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';

import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';

import 'package:wallpaper_app/utilities.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarycolor,
      // Homepage
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1440,
          height: 1051,
          child: Column(
            children: [
              //Frame 105
              Navbar(),
              //frame 115
              Padding(
                padding: EdgeInsets.only(top: 52.63, left: 47),
                child: SizedBox(
                  //  width: 1346,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // frame 106
                          SizedBox(
                            child: MainText(
                              headerText: 'Discover Beautiful Wallpapers',
                              myStyle: TextStyle(
                                fontSize: 60,
                                fontFamily: 'ClashDisplay',
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      Color(0xFFFBB03B),
                                      Color(0xFFEC0C43),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(Rect.fromLTWH(0, 0, 800, 0)),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),

                          //  Second text
                          SizedBox(
                            width: 870,
                            child: MainText(
                              headerText:
                                  'Discover curated collections of stunning wallpapers. Browse by\n'
                                  'category, preview in full-screen, and set your favorites.',
                              myStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                height: 1.0,
                                wordSpacing: 0,
                                color: Color(0xFF575757),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // frame 163
                          SizedBox(
                            width: 1346,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',

                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  'See All',

                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    height: 1,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          UsedColumn(),
                        ],
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
