import 'package:flutter/material.dart';
import 'package:wallpaper_app/Reusable/categorycard.dart';
import 'package:wallpaper_app/Reusable/categoryrow.dart';

class ListViews extends StatelessWidget {
  const ListViews({super.key});

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
            ),
            SizedBox(width: 20),
            CategoryCard(
              mainText: 'Abstract',
              subText: 'Modern Geometric and artistic designs',
              lastText: '4 wallpapers',
              myImage: 'images/abstract.jpg',
              myfunction: () {
                Navigator.pushNamed(context, '/wallpaper');
              },
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
