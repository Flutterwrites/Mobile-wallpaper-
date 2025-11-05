import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';
import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';
import 'package:wallpaper_app/screens/homepage.dart';
import 'package:wallpaper_app/utilities.dart';

class ActiveWallpaper extends StatelessWidget {
  const ActiveWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarycolor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1155,
          width: 1440,
          child: Column(
            children: [
              Navbar(),
              Padding(
                padding: EdgeInsets.only(top: 52.63),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: 1346,
                      height: 250.33,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(43),
                        border: Border.all(color: const Color(0x1A000000)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 117.77,
                            height: 210.33,
                            decoration: BoxDecoration(
                              color: const Color(0x4D000000),
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(
                                color: const Color(0xFFE3E3E3),
                                width: 3,
                              ),
                              image: const DecorationImage(
                                image: AssetImage('images/images.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          SizedBox(
                            width: 1036,
                            height: 146,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainText(
                                      headerText: 'Your Active Wallpaper',
                                      myStyle: TextStyle(
                                        fontSize: 36,
                                        fontFamily: 'ClashDisplay',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        foreground: Paint()
                                          ..shader =
                                              const LinearGradient(
                                                colors: [
                                                  Color(0xFFFBB03B),
                                                  Color(0xFFEC0C43),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ).createShader(
                                                Rect.fromLTWH(0, 0, 800, 0),
                                              ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    MainText(
                                      headerText:
                                          'This wallpaper is currently set as your active background',
                                      myStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        height: 1.0,
                                        wordSpacing: 0,
                                        color: Color(0xFF575757),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                                Rows(
                                  text1: 'Category',
                                  text2: '-',
                                  text3: 'Nature',
                                ),
                                Rows(
                                  text1: 'Selection',
                                  text2: '-',
                                  text3: 'Wallpaper 5',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            height: 146,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(6.53),
                                  decoration: BoxDecoration(
                                    color: const Color(0x1A7C7C7C),
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: const Color(0xFFE5E5E5), //
                                      width: 0.5,
                                    ),
                                  ),
                                  child: SvgPicture.asset('icons/arrow.svg'),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(6.53),
                                  decoration: BoxDecoration(
                                    color: const Color(0x1A7C7C7C),
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: const Color(0xFFE5E5E5), //
                                      width: 0.5,
                                    ),
                                  ),
                                  child: SvgPicture.asset('icons/vector.svg'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),
                    UsedColumn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rows extends StatelessWidget {
  const Rows({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1;
  final String text2;
  final String text3;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainText(
          headerText: text1,
          myStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1,
            color: Color(0xFF808080),
          ),
        ),
        SizedBox(width: 4),
        MainText(
          headerText: text2,
          myStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 4),
        MainText(
          headerText: text3,
          myStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
