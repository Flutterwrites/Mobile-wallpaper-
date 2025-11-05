import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';
import 'package:wallpaper_app/Reusable/categorycard.dart';
import 'package:wallpaper_app/Reusable/categoryrow.dart';
import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/screens/homepage.dart';
import 'package:wallpaper_app/utilities.dart';

class UsedColumn extends StatelessWidget {
  const UsedColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Frame 107
        CategoryRow(
          myCard: [
            CategoryCard(
              mainText: 'Nature',
              subText: 'Mountains, Forest and Landscapes',
              lastText: '3 wallpapers',
              myImage: 'images/image.jpg',
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Abstract',
              subText: 'Modern Geomentric and artistic designs',
              lastText: '4 wallpapers',
              myImage: 'images/abstract.jpg',
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Urban',
              subText: 'Cities, architecture and street',
              lastText: '6 wallpapers',
              myImage: 'images/urban.jpg',
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
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Minimalist',
              subText: 'Clean, simple, and elegant',
              lastText: '6 wallpapers',
              myImage: 'images/minimalist.jpg',
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Animals',
              subText: 'Wildlife and nature photography',
              lastText: '4 wallpapers',
              myImage: 'images/animals.jpg',
            ),
          ],
        ),
      ],
    );
  }
}

class BrowseGrid extends StatefulWidget {
  const BrowseGrid({super.key});

  @override
  State<BrowseGrid> createState() => _BrowseGridState();
}

class _BrowseGridState extends State<BrowseGrid> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarycolor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Navbar(),
            Padding(
              padding: const EdgeInsets.only(top: 52.63),
              child: Column(
                children: [
                  SizedBox(
                    width: 1346,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              headerText: 'Browse Categories',
                              myStyle: TextStyle(
                                fontSize: 60,
                                fontFamily: 'ClashDisplay',
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: [
                                      Color(0xFFFBB03B),
                                      Color(0xFFEC0C43),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(Rect.fromLTWH(0, 0, 800, 0)),
                              ),
                            ),
                            const SizedBox(height: 8),
                            MainText(
                              headerText:
                                  'Explore our curated collections of stunning wallpapers',
                              myStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                height: 1.0,
                                wordSpacing: 0,
                                color: const Color(0xFF575757),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() => isGridView = true);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(6.53),
                                decoration: BoxDecoration(
                                  color: isGridView
                                      ? const Color(0x1AEC9E0C)
                                      : const Color(0x1A7C7C7C),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: isGridView
                                        ? const Color(0xFFE5E5E5)
                                        : Colors.transparent,
                                    width: 0.5,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'icons/row2.svg',
                                  color: isGridView
                                      ? const Color(0xFFEC9E0C)
                                      : const Color(0xFFBFBFBF),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            GestureDetector(
                              onTap: () {
                                setState(() => isGridView = false);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(6.53),
                                decoration: BoxDecoration(
                                  color: !isGridView
                                      ? const Color(0x1AEC9E0C)
                                      : const Color(0x1A7C7C7C),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: !isGridView
                                        ? const Color(0xFFE5E5E5)
                                        : Colors.transparent,
                                    width: 0.5,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'icons/column.svg',
                                  color: !isGridView
                                      ? const Color(0xFFEC9E0C)
                                      : const Color(0xFFBFBFBF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isGridView
                        ? const UsedList(key: ValueKey('list'))
                        : const UsedGrid(key: ValueKey('grid')),
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

class UsedList extends StatelessWidget {
  const UsedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CategoryRow(
          myCard: [
            CategoryCard(
              mainText: 'Nature',
              subText: 'Mountains, Forest and Landscapes',
              lastText: '3 wallpapers',
              myImage: 'images/image.jpg',
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Abstract',
              subText: 'Modern Geometric and artistic designs',
              lastText: '4 wallpapers',
              myImage: 'images/abstract.jpg',
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Urban',
              subText: 'Cities, architecture and street',
              lastText: '6 wallpapers',
              myImage: 'images/urban.jpg',
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
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Minimalist',
              subText: 'Clean, simple, and elegant',
              lastText: '6 wallpapers',
              myImage: 'images/minimalist.jpg',
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Animals',
              subText: 'Wildlife and nature photography',
              lastText: '4 wallpapers',
              myImage: 'images/animals.jpg',
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
    final categories = [
      {
        'main': 'Nature',
        'sub': 'Mountains, Forest and Landscapes',
        'last': '3 wallpapers',
        'image': 'images/image.jpg',
      },
      {
        'main': 'Abstract',
        'sub': 'Modern Geometric and artistic designs',
        'last': '4 wallpapers',
        'image': 'images/abstract.jpg',
      },
      {
        'main': 'Urban',
        'sub': 'Cities, architecture and street',
        'last': '6 wallpapers',
        'image': 'images/urban.jpg',
      },
      {
        'main': 'Space',
        'sub': 'Cosmos, planets, and galaxies',
        'last': '3 wallpapers',
        'image': 'images/space.jpg',
      },
      {
        'main': 'Minimalist',
        'sub': 'Clean, simple, and elegant',
        'last': '6 wallpapers',
        'image': 'images/minimalist.jpg',
      },
      {
        'main': 'Animals',
        'sub': 'Wildlife and nature photography',
        'last': '4 wallpapers',
        'image': 'images/animals.jpg',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine column count based on available width
        int crossAxisCount = 3;
        double width = constraints.maxWidth;

        if (width > 1600) {
          crossAxisCount = 5;
        } else if (width > 1200) {
          crossAxisCount = 4;
        } else if (width > 800) {
          crossAxisCount = 3;
        } else if (width > 600) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return GridView.builder(
          key: const ValueKey('gridView'),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.4,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return CategoryCard(
              mainText: cat['main']!,
              subText: cat['sub']!,
              lastText: cat['last']!,
              myImage: cat['image']!,
            );
          },
        );
      },
    );
  }
}
