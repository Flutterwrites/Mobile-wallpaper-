import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';
import 'package:wallpaper_app/Reusable/categoryrow.dart';
import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/utilities.dart';

class ActiveWallpaper extends StatelessWidget {
  const ActiveWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Navbar(currentRoute: '/home'),
              const SizedBox(height: 52),
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = constraints.maxWidth;
                  final isCompact = cardWidth < 900;

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(43),
                      border: Border.all(color: const Color(0x1A000000)),
                    ),
                    child: isCompact
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildPreviewImage(cardWidth * 0.5),
                              const SizedBox(height: 20),
                              _buildTextSection(
                                context,
                                cardWidth,
                                isCompact: true,
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerRight,
                                child: _buildIconsRow(),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildPreviewImage(cardWidth * 0.15),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _buildTextSection(context, cardWidth),
                              ),
                              const SizedBox(width: 20),
                              _buildIconsRow(),
                            ],
                          ),
                  );
                },
              ),
              const SizedBox(height: 32),
              const UsedColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewImage(double width) {
    return Container(
      width: width,
      height: width * 1.8,
      decoration: BoxDecoration(
        color: const Color(0x4D000000),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFE3E3E3), width: 3),
        image: const DecorationImage(
          image: AssetImage('images/images.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTextSection(
    BuildContext context,
    double width, {
    bool isCompact = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainText(
          headerText: 'Your Active Wallpaper',
          myStyle: TextStyle(
            fontSize: screenWidth < 800 ? 28 : 36,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w500,
            height: 1.0,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0, 0, 800, 0)),
          ),
        ),
        const SizedBox(height: 12),
        MainText(
          headerText:
              'This wallpaper is currently set as your active background',
          myStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: screenWidth < 800 ? 16 : 20,
            color: const Color(0xFF575757),
          ),
        ),
        const SizedBox(height: 20),
        Rows(text1: 'Category', text2: '-', text3: 'Nature'),
        Rows(text1: 'Selection', text2: '-', text3: 'Wallpaper 5'),
      ],
    );
  }

  /// ⬅️➡️ Icon buttons (arrow & vector)
  Widget _buildIconsRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIcon('icons/arrow.svg'),
        const SizedBox(width: 12),
        _buildIcon('icons/vector.svg'),
      ],
    );
  }

  Widget _buildIcon(String asset) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(6.53),
      decoration: BoxDecoration(
        color: const Color(0x1A7C7C7C),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 0.5),
      ),
      child: SvgPicture.asset(asset),
    );
  }
}
