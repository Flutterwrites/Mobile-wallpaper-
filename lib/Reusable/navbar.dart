import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';

import 'package:wallpaper_app/screens/homepage.dart';

import 'package:wallpaper_app/utilities.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/home';

    void navigateTo(Widget page, String routeName) {
      if (currentRoute != routeName) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => page,
            settings: RouteSettings(name: routeName),
          ),
        );
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      height: 98,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 47),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('images/Vector.png', width: 16, height: 16),
              const SizedBox(width: 8),
              Text('Wallpaper Studio', style: ktextstyle),
            ],
          ),

          Row(
            children: [
              NavButton(
                icon: 'icons/home.svg',
                label: 'Home',
                isActive: currentRoute == '/home',
                onTap: () => navigateTo(const Homepage(), '/home'),
              ),
              const SizedBox(width: 12),
              NavButton(
                icon: 'icons/browse.svg',
                label: 'Browse',
                isActive: currentRoute == '/browse',
                onTap: () => navigateTo(const BrowseGrid(), '/browse'),
              ),
              const SizedBox(width: 12),
              NavButton(
                icon: 'icons/heart.svg',
                label: 'Favourites',
                isActive: currentRoute == '/favourites',
                onTap: () => navigateTo(const FavouritesPage(), '/favourites'),
              ),
              const SizedBox(width: 12),
              NavButton(
                icon: 'icons/settings.svg',
                label: 'Settings',
                isActive: currentRoute == '/settings',
                onTap: () => navigateTo(const SettingsPage(), '/settings'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NavButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Opacity(
        opacity: isActive ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFF5F5F5) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: const Color(0xFFF5F5F5)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 10),
              Text(label, style: ktextstyle),
            ],
          ),
        ),
      ),
    );
  }
}
