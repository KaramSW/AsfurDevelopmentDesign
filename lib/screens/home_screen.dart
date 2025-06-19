import 'package:flutter/material.dart';
import 'package:flutter_projects/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(19, 60, 19, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/Icons/asfurLogo.svg',
                          width: 60,
                          height: 37.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Hi, ',
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'Hassan!',
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,

                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/Icons/hp_icons/notifi.svg',
                              height: 50,
                              width: 50,
                            ),
                            padding: EdgeInsets.zero,
                            highlightColor: const Color.fromARGB(
                              80,
                              158,
                              158,
                              158,
                            ),
                            splashRadius: 25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Your Compass to \nPossibilities! 🌏✈️',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Destination',
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 10,
                              minHeight: 10,
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: 'Ping',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 24, 34, 48),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16.5,
                                0,
                                10.5,
                                0,
                              ),
                              child: SvgPicture.asset(
                                'assets/Icons/hp_icons/searchIcon.svg',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 208, 213, 221),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 208, 213, 221),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discover',
                              style: TextStyle(
                                fontFamily: 'Ping',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 45,
                              child: ElevatedButton(
                                onPressed: () {},
                                style:
                                    ElevatedButton.styleFrom(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      overlayColor: Color.fromARGB(
                                        255,
                                        18,
                                        146,
                                        149,
                                      ),
                                    ).copyWith(
                                      elevation: WidgetStateProperty.all(
                                        0,
                                      ), // No elevation in all states
                                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'All',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          18,
                                          146,
                                          149,
                                        ),
                                        fontFamily: 'Ping',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SvgPicture.asset(
                                      'assets/Icons/hp_icons/allButtonArrowIcon.svg',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 85,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19),
                                child: _buildCategoryItem(
                                  'assets/Icons/hp_icons/category_icons/relaxationIcon.svg',
                                  'Relaxation',
                                  () {},
                                ),
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/romanticIcon.svg',
                                'Romantic',
                                () {},
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/adventureIcon.svg',
                                'Adventure',
                                () {},
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/luxuryIcon.svg',
                                'Luxury',
                                () {},
                              ),
                              _buildCategoryItem(
                                'assets/Icons/hp_icons/category_icons/culturalIcon.svg',
                                'Cultural',
                                () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 19),
                                child: _buildCategoryItem(
                                  'assets/Icons/hp_icons/category_icons/familyIcon.svg',
                                  'Family',
                                  () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19, top: 42),
                        child: Text(
                          'Top Packages',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 61),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 12,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 19),
                              child: _buildPackageItem(
                                'assets/pictures/hp_pictures/historicalKorea.jpg',
                                'Historical Korea',
                                'assets/Icons/hp_icons/flags/southKoreaFlag.svg',
                                'Seoul, Korea',
                                '5 Days | 4 Nights',
                                '100',
                                1,
                                'assets/pictures/hp_pictures/islaAvatar.png',
                                'May Green',
                                '4.9',
                                () {},
                              ),
                            ),
                            _buildPackageItem(
                              'assets/pictures/hp_pictures/coldplayConcert.jpg',
                              'Coldplay Concert',
                              'assets/Icons/hp_icons/flags/germanyFlag.svg',
                              'Munich, Germany',
                              '25th June',
                              '100',
                              2,
                              'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
                              'Travel Online Agency',
                              '5',
                              () {},
                            ),
                            _buildPackageItem(
                              'assets/pictures/hp_pictures/summerInLondon.jpg',
                              'Summer in London',
                              'assets/Icons/hp_icons/flags/britishFlag.svg',
                              'London, GP',
                              '5 Days | 8 Nights',
                              '100',
                              2,
                              'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
                              'Travel Online Agency',
                              '5',
                              () {},
                            ),

                            _buildPackageItem(
                              'assets/pictures/hp_pictures/historicalKorea.jpg',
                              'Historical Korea',
                              'assets/Icons/hp_icons/flags/southKoreaFlag.svg',
                              'Seoul, Korea',
                              '5 Days | 4 Nights',
                              '100',
                              1,
                              'assets/pictures/hp_pictures/islaAvatar.png',
                              'May Green',
                              '4.9',
                              () {},
                            ),
                            _buildPackageItem(
                              'assets/pictures/hp_pictures/coldplayConcert.jpg',
                              'Coldplay Concert',
                              'assets/Icons/hp_icons/flags/germanyFlag.svg',
                              'Munich, Germany',
                              '25th June',
                              '100',
                              2,
                              'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
                              'Travel Online Agency',
                              '5',
                              () {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 19),
                              child: _buildPackageItem(
                                'assets/pictures/hp_pictures/summerInLondon.jpg',
                                'Summer in London',
                                'assets/Icons/hp_icons/flags/britishFlag.svg',
                                'London, GP',
                                '5 Days | 8 Nights',
                                '100',
                                2,
                                'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
                                'Travel Online Agency',
                                '5',
                                () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Text(
                          'Getaways Panorama',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 0, 19, 48),
                        child: Row(
                          spacing: 8,
                          children: [
                            _buildPanoramaItem(
                              'assets/pictures/hp_pictures/greecePicture.jpg',
                              '13',
                              'assets/Icons/hp_icons/flags/greekFlag.svg',
                              'Greece',
                              'Athens',
                              () {},
                            ),
                            _buildPanoramaItem(
                              'assets/pictures/hp_pictures/ThailandPicture.jpg',
                              '10',
                              'assets/Icons/hp_icons/flags/thailandFlag.svg',
                              'Thailand',
                              'Phuket',
                              () {},
                            ),
                            _buildPanoramaItem(
                              'assets/pictures/hp_pictures/francePicture.jpg',
                              '8',
                              'assets/Icons/hp_icons/flags/frenchFlag.svg',
                              'France',
                              'Paris',
                              () {},
                            ),
                            _buildPanoramaItem(
                              'assets/pictures/hp_pictures/japanPicture.jpg',
                              '24',
                              'assets/Icons/hp_icons/flags/japaneseFlag.svg',
                              'Japan',
                              'Tokyo',
                              () {},
                            ),
                            _buildPanoramaItem(
                              'assets/pictures/hp_pictures/austriaPicture.jpg',
                              '17',
                              'assets/Icons/hp_icons/flags/austrianFlag.svg',
                              'Austria',
                              'Vienna',
                              () {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 1000),
                      child: const Text('Welcome to the Home Screen!'),
                    ),
                    Image.asset(
                      'assets/pictures/hp_pictures/ThailandPicture.jpg',
                      width: 160,
                      height: 244,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Go Back'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    String iconPath,
    String label,
    VoidCallback onPressed,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    239,
                    229,
                    246,
                  ).withValues(alpha: 0.8), // Shadow color with opacity
                  spreadRadius: 2, // Spread value
                  blurRadius: 9, // Blur value
                  offset: Offset(0, 7), // Offset (horizontal, vertical)
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: const Color.fromARGB(255, 239, 229, 246),
                side: BorderSide(
                  color: const Color.fromARGB(255, 232, 217, 239),
                  width: 1,
                ),
              ),
              child: SvgPicture.asset(iconPath, width: 24, height: 24),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Ping',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  ////////

  Widget _buildPackageItem(
    String iconPath,
    String packageName,
    String countryFlagPath,
    String countryCityName,
    String dateOrDuration,
    String price,
    int avatarShape,
    String avatarPath,
    String providerName,
    String providerRating,
    VoidCallback onPressed,
  ) {
    double avatarRadius = 30;
    if (avatarShape == 1) {
      avatarRadius = 30;
    } else if (avatarShape == 2) {
      avatarRadius = 4;
    }
    return SizedBox(
      width: 254,
      height: 346,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                255,
                234,
                235,
                236,
              ), // Shadow color with opacity
              spreadRadius: 0, // Spread value
              blurRadius: 8, // Blur value
              offset: Offset(0, 13), // Offset (horizontal, vertical)
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
                padding: EdgeInsetsGeometry.only(top: 16, left: 16),
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
                                color: const Color.fromARGB(255, 249, 250, 251),
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
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
    );
  }

  Widget _buildPanoramaItem(
    String imagePath,
    String numOfPackages,
    String countryFlagPath,
    String packageCountry,
    String packageCity,
    VoidCallback onPressed,
  ) {
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

            //gradient to view Country, Flag, and city clearly
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

            //packages count label
            Positioned(
              left: 9,
              top: 8,
              child: SizedBox(
                height: 17,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromARGB(255, 240, 253, 251),
                    border: Border.all(
                      color: const Color.fromARGB(255, 153, 246, 238),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),

                    child: Text(
                      '$numOfPackages Packages',
                      style: TextStyle(
                        fontFamily: 'Ping',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 18, 109, 113),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //country flag country, and city labels
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
