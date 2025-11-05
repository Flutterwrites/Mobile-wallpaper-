import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/screens/browsegridview.dart';

import 'package:wallpaper_app/screens/homepage.dart';

import 'package:wallpaper_app/utilities.dart';

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

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/home';
    final screenWidth = MediaQuery.of(context).size.width;

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
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: 10,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 700;

          return isCompact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrand(),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _navItems(
                        currentRoute,
                        navigateTo,
                        screenWidth,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBrand(),
                    Row(
                      children: _navItems(
                        currentRoute,
                        navigateTo,
                        screenWidth,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildBrand() {
    return Row(
      children: [
        Image.asset('images/Vector.png', width: 20, height: 20),
        const SizedBox(width: 8),
        Text('Wallpaper Studio', style: ktextstyle),
      ],
    );
  }

  List<Widget> _navItems(
    String currentRoute,
    Function navigateTo,
    double screenWidth,
  ) {
    return [
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
    ];
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
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = screenWidth < 600 ? 0.8 : 1.0;

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isActive ? 1 : 0.5,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 8 : 16,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFF5F5F5) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: const Color(0xFFF5F5F5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: 16 * textScale,
                height: 16 * textScale,
              ),
              const SizedBox(width: 8),
              Text(label, style: ktextstyle.copyWith(fontSize: 16 * textScale)),
            ],
          ),
        ),
      ),
    );
  }
}
