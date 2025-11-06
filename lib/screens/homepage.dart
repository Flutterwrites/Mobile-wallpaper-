import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Reusable/navbar.dart';
import 'package:wallpaper_app/Reusable/categoryrow.dart';
import 'package:wallpaper_app/utilities.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
              Navbar(currentRoute: '/home'),
              SizedBox(height: 50),
              Text(
                'Discover Beautiful Wallpapers',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth < 800 ? 36 : 60,
                  fontWeight: FontWeight.w600,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(Rect.fromLTWH(0, 0, 800, 0)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth < 800 ? 16 : 24,
                  color: const Color(0xFF575757),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color(0xFF808080),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const UsedColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
