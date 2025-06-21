import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackageItemWidget extends StatelessWidget {
  final String iconPath;
  final String packageName;
  final String countryFlagPath;
  final String countryCityName;
  final String dateOrDuration;
  final String price;
  final int avatarShape;
  final String avatarPath;
  final String providerName;
  final String providerRating;
  final VoidCallback onPressed;

  const PackageItemWidget({
    super.key,
    required this.iconPath,
    required this.packageName,
    required this.countryFlagPath,
    required this.countryCityName,
    required this.dateOrDuration,
    required this.price,
    required this.avatarShape,
    required this.avatarPath,
    required this.providerName,
    required this.providerRating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 30;
    if (avatarShape == 1) {
      avatarRadius = 30;
    } else if (avatarShape == 2) {
      avatarRadius = 4;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: SizedBox(
        width: 254,
        height: 346,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.5),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 234, 235, 236),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 13),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style:
                ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.5),
                  ),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: const Color.fromARGB(255, 242, 244, 247),
                    width: 1,
                  ),
                ).copyWith(
                  elevation: WidgetStateProperty.all(0),
                  overlayColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 242, 244, 247),
                  ),
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.5),
                      topRight: Radius.circular(18.5),
                    ),
                    child: Image(
                      image: AssetImage(iconPath),
                      width: 254,
                      height: 168,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9, left: 16),
                  child: Text(
                    packageName,
                    style: const TextStyle(
                      fontFamily: 'Ping',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 24, 34, 48),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 16),
                      child: SvgPicture.asset(
                        countryFlagPath,
                        width: 17,
                        height: 13,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      countryCityName,
                      style: TextStyle(
                        fontFamily: 'Ping',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 24, 34, 48),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 16),
                  child: Text(
                    dateOrDuration,
                    style: TextStyle(
                      fontFamily: 'Ping',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 102, 112, 133),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 2, 0),
                        child: SvgPicture.asset(
                          'assets/Icons/hp_icons/currency_icons/DirhamSymbol.svg',
                          width: 13,
                          height: 12,
                        ),
                      ),
                      Text(
                        '$price/ ',
                        style: TextStyle(
                          fontFamily: 'Ping',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 18, 109, 113),
                        ),
                      ),
                      Text(
                        'Per Person',
                        style: TextStyle(
                          fontFamily: 'Ping',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 24, 34, 48),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: SizedBox(
                    width: 254,
                    height: 48,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 242, 244, 247),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18.5),
                          bottomRight: Radius.circular(18.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 41,
                              height: 34,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          avatarRadius,
                                        ),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(avatarRadius),
                                        ),
                                        child: Image.asset(
                                          avatarPath,
                                          fit: BoxFit.cover,
                                          width: 32,
                                          height: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 25,
                                    top: 16,
                                    child: SvgPicture.asset(
                                      'assets/Icons/hp_icons/verifiedIcon.svg',
                                      width: 16,
                                      height: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              providerName,
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 24, 34, 48),
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 26,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromARGB(
                                    255,
                                    249,
                                    250,
                                    251,
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      255,
                                      234,
                                      236,
                                      240,
                                    ),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    4,
                                    0,
                                    4,
                                    0,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Icons/hp_icons/starIcon.svg',
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        providerRating,
                                        style: TextStyle(
                                          fontFamily: 'Ping',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
