import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';

class GridViews extends StatelessWidget {
  const GridViews({super.key});

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
