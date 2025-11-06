import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';
import 'package:wallpaper_app/Reusable/categorycard.dart';
import 'package:wallpaper_app/Reusable/categoryrow.dart';
import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';

import 'package:wallpaper_app/utilities.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimarycolor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Navbar(currentRoute: '/browse'),

            Padding(
              padding: const EdgeInsets.only(top: 43),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset('icons/back.svg'),
                      ),
                      const SizedBox(width: 8),
                      MainText(
                        headerText: 'Back to Categories',
                        myStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          height: 1,
                          color: const Color(0xFF979797),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isCompact = constraints.maxWidth < 700;
                      if (isCompact) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              headerText: 'Nature',
                              myStyle: const TextStyle(
                                fontFamily: 'ClashDisplay',
                                fontWeight: FontWeight.w400,
                                fontSize: 40,
                                height: 1,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _ToggleButtons(
                              isGridView: isGridView,
                              onToggle: (value) {
                                setState(() => isGridView = value);
                              },
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MainText(
                                headerText: 'Nature',
                                myStyle: const TextStyle(
                                  fontFamily: 'ClashDisplay',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 48,
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                              _ToggleButtons(
                                isGridView: isGridView,
                                onToggle: (value) {
                                  setState(() => isGridView = value);
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isGridView
                        ? const UsedGrids(key: ValueKey('grid'))
                        : const UsedLists(key: ValueKey('list')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔘 Toggle Button Row
class _ToggleButtons extends StatelessWidget {
  final bool isGridView;
  final ValueChanged<bool> onToggle;

  const _ToggleButtons({required this.isGridView, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ToggleIcon(
          isActive: !isGridView,
          asset: 'icons/row2.svg', // list icon
          onTap: () => onToggle(false),
        ),
        const SizedBox(width: 8),
        _ToggleIcon(
          isActive: isGridView,
          asset: 'icons/column.svg', // grid icon
          onTap: () => onToggle(true),
        ),
      ],
    );
  }
}

// 🎚️ Individual Toggle Icon
class _ToggleIcon extends StatelessWidget {
  final bool isActive;
  final String asset;
  final VoidCallback onTap;

  const _ToggleIcon({
    required this.isActive,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(6.53),
        decoration: BoxDecoration(
          color: isActive ? const Color(0x1AEC9E0C) : const Color(0x1A7C7C7C),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isActive ? const Color(0xFFE5E5E5) : Colors.transparent,
            width: 0.5,
          ),
        ),
        child: SvgPicture.asset(
          asset,
          color: isActive ? const Color(0xFFEC9E0C) : const Color(0xFFBFBFBF),
        ),
      ),
    );
  }
}

class UsedGrids extends StatelessWidget {
  const UsedGrids({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              ReusableContainer(
                mainText: 'Nature 1',
                subText: '',

                myImage: 'images/nature 1.jpg',
                lastText: 'Nature',
              ),
              SizedBox(height: 20),
              ReusableContainer(
                mainText: 'Nature 2',
                subText: '',

                myImage: 'images/nature 2.jpg',
                lastText: 'Nature',
              ),
              SizedBox(height: 20),
              ReusableContainer(
                mainText: 'Nature 3',
                subText: '',

                myImage: 'images/nature 3.jpg',
                lastText: 'Nature',
              ),
            ],
          ),
          SizedBox(height: 20),

          ReusableContainer(
            mainText: 'Nature 4',
            subText: '',

            myImage: 'images/nature 4.jpg',
            lastText: 'Nature',
          ),
          SizedBox(height: 20),
          ReusableContainer(
            mainText: 'Nature 5',
            subText: '',

            myImage: 'images/nature 5.jpg',
            lastText: 'Nature',
          ),
          SizedBox(height: 20),
          ReusableContainer(
            mainText: 'Nature 6',
            subText: '',

            myImage: 'images/nature 6.jpg',
            lastText: 'Nature',
          ),
        ],
      ),
    );
  }
}

class UsedLists extends StatelessWidget {
  const UsedLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryRow(
          myCard: [
            WallpaperCategory(
              text1: 'Nature 1',
              text2: 'Nature',
              imag: 'images/nature 1.jpg',
            ),
            SizedBox(width: 20),
            WallpaperCategory(
              text1: 'Nature 2',
              text2: 'Nature',
              imag: 'images/nature 2.jpg',
            ),
            SizedBox(width: 20),
            WallpaperCategory(
              text1: 'Nature 3',
              text2: 'Nature',
              imag: 'images/nature 3.jpg',
            ),
          ],
        ),
        SizedBox(height: 23),
        CategoryRow(
          myCard: [
            WallpaperCategory(
              text1: 'Nature 4',
              text2: 'Nature',
              imag: 'images/nature 4.jpg',
            ),
            SizedBox(width: 20),
            WallpaperCategory(
              text1: 'Nature 5',
              text2: 'Nature',
              imag: 'images/nature 5.jpg',
            ),
            SizedBox(width: 20),
            WallpaperCategory(
              text1: 'Nature 6',
              text2: 'Nature',
              imag: 'images/nature 6.jpg',
            ),
          ],
        ),
      ],
    );
  }
}

class WallpaperCategory extends StatelessWidget {
  const WallpaperCategory({
    super.key,
    required this.text1,
    required this.text2,
    required this.imag,
  });
  final String text1;
  final String text2;
  final String imag;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imag), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0x4D000000),
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0x33FFFFFF)),
                  ),
                  child: Text(
                    text2,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
