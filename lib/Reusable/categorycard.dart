import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.mainText,
    required this.subText,
    required this.lastText,
    required this.myImage,
    this.myfunction,
  });
  final String mainText;
  final String subText;
  final String lastText;
  final String myImage;
  final VoidCallback? myfunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myfunction,
      // () {
      //   Navigator.pushNamed(context, '/active');
      // },
      child: Container(
        width: 435.33,

        height: 290.71,
        decoration: BoxDecoration(
          color: Color(0x4D000000),
          borderRadius: BorderRadius.circular(26),
          image: DecorationImage(image: AssetImage(myImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 178, left: 25),

          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subText,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 0.5),
                  ),
                  child: Text(
                    lastText,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
