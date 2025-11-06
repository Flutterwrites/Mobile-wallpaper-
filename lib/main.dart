import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/active.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';
import 'package:wallpaper_app/screens/homepage.dart';
import 'package:wallpaper_app/screens/wallpapersetup.dart';

void main() {
  runApp(const WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/home',

      routes: {
        '/home': (context) => const Homepage(),
        '/browse': (context) => const BrowseGrid(),
        '/active': (context) => const ActiveWallpaper(),
        '/wallpaper': (context) => const Wallpaper(),
        //   '/favourites': (context) => const FavouritesPage(),
        //   '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
