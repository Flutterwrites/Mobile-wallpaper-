import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/Textfields.dart';
import 'package:wallpaper_app/Reusable/categorycard.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.myCard});
  final List<Widget> myCard;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: myCard),
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
