import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';
import 'package:wallpaper_app/Reusable/categorycard.dart';
import 'package:wallpaper_app/Reusable/categoryrow.dart';
import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/utilities.dart';

class BrowseGrid extends StatefulWidget {
  const BrowseGrid({super.key});

  @override
  State<BrowseGrid> createState() => _BrowseGridState();
}

class _BrowseGridState extends State<BrowseGrid> {
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
          children: [
            const Navbar(),
            LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 700;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isNarrow
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _HeaderSection(screenWidth: screenWidth),
                              const SizedBox(height: 20),
                              _ToggleButtons(
                                isGridView: isGridView,
                                onToggle: (value) {
                                  setState(() => isGridView = value);
                                },
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _HeaderSection(screenWidth: screenWidth),
                              _ToggleButtons(
                                isGridView: isGridView,
                                onToggle: (value) {
                                  setState(() => isGridView = value);
                                },
                              ),
                            ],
                          ),
                    const SizedBox(height: 50),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isGridView
                          ? const UsedGrid(key: ValueKey('grid'))
                          : const UsedList(key: ValueKey('list')),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final double screenWidth;
  const _HeaderSection({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainText(
          headerText: 'Browse Categories',
          myStyle: TextStyle(
            fontSize: screenWidth < 800 ? 36 : 60,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w500,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0, 0, 800, 0)),
          ),
        ),
        const SizedBox(height: 8),
        MainText(
          headerText: 'Explore our curated collections of stunning wallpapers',
          myStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: screenWidth < 800 ? 18 : 24,
            color: const Color(0xFF575757),
          ),
        ),
      ],
    );
  }
}

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

class UsedList extends StatelessWidget {
  const UsedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryRow(
          myCard: [
            CategoryCard(
              mainText: 'Nature',
              subText: 'Mountains, Forest and Landscapes',
              lastText: '3 wallpapers',
              myImage: 'images/image.jpg',
              myfunction: () {},
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Abstract',
              subText: 'Modern Geometric and artistic designs',
              lastText: '4 wallpapers',
              myImage: 'images/abstract.jpg',
              myfunction: () {},
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Urban',
              subText: 'Cities, architecture and street',
              lastText: '6 wallpapers',
              myImage: 'images/urban.jpg',
              myfunction: () {},
            ),
          ],
        ),
        SizedBox(height: 23),
        CategoryRow(
          myCard: [
            CategoryCard(
              mainText: 'Space',
              subText: 'Cosmos, planets, and galaxies',
              lastText: '3 wallpapers',
              myImage: 'images/space.jpg',
              myfunction: () {},
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Minimalist',
              subText: 'Clean, simple, and elegant',
              lastText: '6 wallpapers',
              myImage: 'images/minimalist.jpg',
              myfunction: () {},
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Animals',
              subText: 'Wildlife and nature photography',
              lastText: '4 wallpapers',
              myImage: 'images/animals.jpg',
              myfunction: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class UsedGrid extends StatelessWidget {
  const UsedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              ReusableContainer(
                mainText: 'Nature',
                subText: 'Mountains, Forest and Landscapes',
                lastText: '3 wallpapers',
                myImage: 'images/image.jpg',
              ),
              SizedBox(height: 20),
              ReusableContainer(
                mainText: 'Abstract',
                subText: 'Modern Geomentric and artistic designs',
                lastText: '4 wallpapers',
                myImage: 'images/abstract.jpg',
              ),
              SizedBox(height: 20),
              ReusableContainer(
                mainText: 'Urban',
                subText: 'Cities, architecture and street',
                lastText: '6 wallpapers',
                myImage: 'images/urban.jpg',
              ),
            ],
          ),
          SizedBox(height: 20),

          ReusableContainer(
            mainText: 'Space',
            subText: 'Cosmos, planets, and galaxies',
            lastText: '3 wallpapers',
            myImage: 'images/space.jpg',
          ),
          SizedBox(height: 20),
          ReusableContainer(
            mainText: 'Minimalist',
            subText: 'Clean, simple, and elegant',
            lastText: '6 wallpapers',
            myImage: 'images/minimalist.jpg',
          ),
          SizedBox(height: 20),
          ReusableContainer(
            mainText: 'Animals',
            subText: 'Wildlife and nature photography',
            lastText: '4 wallpapers',
            myImage: 'images/animals.jpg',
          ),
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    super.key,
    required this.mainText,
    required this.subText,
    required this.lastText,
    required this.myImage,
  });
  final String mainText;
  final String subText;
  final String lastText;
  final String myImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1346,
      height: 225.12,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x1A000000), width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 277.21,
            height: 185.12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.56),
              image: DecorationImage(
                image: AssetImage(myImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              MainText(
                headerText: mainText,

                myStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  height: 1,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              MainText(
                headerText: subText,

                myStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 19),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0x1A878787),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0x0D000000), width: 1),
                ),
                child: Text(
                  lastText,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
