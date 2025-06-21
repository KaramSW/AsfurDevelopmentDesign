import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PanoramaItemWidget extends StatelessWidget {
  final String imagePath;
  final String numOfPackages;
  final String countryFlagPath;
  final String packageCountry;
  final String packageCity;
  final int colorPalette;
  final VoidCallback onPressed;

  const PanoramaItemWidget({
    super.key,
    required this.imagePath,
    required this.numOfPackages,
    required this.countryFlagPath,
    required this.packageCountry,
    required this.packageCity,
    required this.colorPalette,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color packageFontColor = const Color.fromARGB(255, 18, 146, 149);
    Color packageBackgroundColor = const Color.fromARGB(255, 240, 253, 251);
    Color packageBorderColor = const Color.fromARGB(255, 153, 246, 238);

    if (colorPalette == 1) {
      packageFontColor = const Color.fromARGB(255, 23, 92, 211);
      packageBackgroundColor = const Color.fromARGB(255, 239, 248, 255);
      packageBorderColor = const Color.fromARGB(255, 178, 221, 255);
    } else if (colorPalette == 2) {
      packageFontColor = const Color.fromARGB(255, 180, 35, 24);
      packageBackgroundColor = const Color.fromARGB(255, 254, 243, 242);
      packageBorderColor = const Color.fromARGB(255, 254, 205, 202);
    } else if (colorPalette == 3) {
      packageFontColor = const Color.fromARGB(255, 181, 71, 8);
      packageBackgroundColor = const Color.fromARGB(255, 255, 250, 235);
      packageBorderColor = const Color.fromARGB(255, 254, 223, 137);
    }

    return SizedBox(
      width: 160,
      height: 224,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),

            // Gradient to view Country, Flag, and city clearly
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.2),
                      Colors.black.withValues(alpha: 0.4),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Packages count label
            Positioned(
              left: 9,
              top: 8,
              child: SizedBox(
                height: 19,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: packageBackgroundColor,
                    border: Border.all(color: packageBorderColor, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Text(
                      '$numOfPackages Packages',
                      style: TextStyle(
                        fontFamily: 'Ping',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: packageFontColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Country flag and country labels
            Positioned(
              left: 9,
              top: 185,
              child: SizedBox(
                height: 21,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(countryFlagPath, width: 16, height: 16),
                      SizedBox(width: 4),
                      Text(
                        packageCountry,
                        style: TextStyle(
                          fontFamily: 'Ping',
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // City label
            Positioned(
              left: 9,
              top: 205,
              child: Text(
                ' $packageCity',
                style: TextStyle(
                  fontFamily: 'Ping',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
