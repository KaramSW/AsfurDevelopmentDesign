import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/package_item_widget.dart';
import '../widgets/panorama_item_widget.dart';

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
                      child: SizedBox(
                        height: 406,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          scrollDirection: Axis.horizontal,
                          itemCount: _getPackageItems().length,
                          itemBuilder: (context, index) {
                            final packageData = _getPackageItems()[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index < _getPackageItems().length - 1
                                    ? 12
                                    : 0,
                              ),
                              child: PackageItemWidget(
                                iconPath: packageData['iconPath']!,
                                packageName: packageData['packageName']!,
                                countryFlagPath:
                                    packageData['countryFlagPath']!,
                                countryCityName:
                                    packageData['countryCityName']!,
                                dateOrDuration: packageData['dateOrDuration']!,
                                price: packageData['price']!,
                                avatarShape: packageData['avatarShape'] as int,
                                avatarPath: packageData['avatarPath']!,
                                providerName: packageData['providerName']!,
                                providerRating: packageData['providerRating']!,
                                onPressed: () {},
                              ),
                            );
                          },
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
                            PanoramaItemWidget(
                              imagePath:
                                  'assets/pictures/hp_pictures/greecePicture.jpg',
                              numOfPackages: '13',
                              countryFlagPath:
                                  'assets/Icons/hp_icons/flags/greekFlag.svg',
                              packageCountry: 'Greece',
                              packageCity: 'Athens',
                              colorPalette: 1,
                              onPressed: () {},
                            ),
                            PanoramaItemWidget(
                              imagePath:
                                  'assets/pictures/hp_pictures/ThailandPicture.jpg',
                              numOfPackages: '10',
                              countryFlagPath:
                                  'assets/Icons/hp_icons/flags/thailandFlag.svg',
                              packageCountry: 'Thailand',
                              packageCity: 'Phuket',
                              colorPalette: 0,
                              onPressed: () {},
                            ),
                            PanoramaItemWidget(
                              imagePath:
                                  'assets/pictures/hp_pictures/francePicture.jpg',
                              numOfPackages: '8',
                              countryFlagPath:
                                  'assets/Icons/hp_icons/flags/frenchFlag.svg',
                              packageCountry: 'France',
                              packageCity: 'Paris',
                              colorPalette: 0,
                              onPressed: () {},
                            ),
                            PanoramaItemWidget(
                              imagePath:
                                  'assets/pictures/hp_pictures/japanPicture.jpg',
                              numOfPackages: '24',
                              countryFlagPath:
                                  'assets/Icons/hp_icons/flags/japaneseFlag.svg',
                              packageCountry: 'Japan',
                              packageCity: 'Tokyo',
                              colorPalette: 2,
                              onPressed: () {},
                            ),
                            PanoramaItemWidget(
                              imagePath:
                                  'assets/pictures/hp_pictures/austriaPicture.jpg',
                              numOfPackages: '17',
                              countryFlagPath:
                                  'assets/Icons/hp_icons/flags/austrianFlag.svg',
                              packageCountry: 'Austria',
                              packageCity: 'Vienna',
                              colorPalette: 3,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(19, 0, 19, 48),
                      child: SizedBox(
                        width: double.infinity,
                        height: 277,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 254, 252),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 204, 251, 245),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 234, 235, 236),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: Offset(0, 12),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icons/hp_icons/rocketIcon.svg',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  'Design your own\nperfect trip!',
                                  style: TextStyle(
                                    fontFamily: 'Ping',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: const Color.fromARGB(
                                      255,
                                      24,
                                      34,
                                      48,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Choose your destinations, timings,'
                                  ' and accommodations. Your adventure, your way.',
                                  style: TextStyle(
                                    fontFamily: 'Ping',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                      255,
                                      24,
                                      34,
                                      48,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),

                                SizedBox(
                                  width: 141,
                                  height: 35,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        21,
                                        183,
                                        183,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Explore Now',
                                      style: TextStyle(
                                        fontFamily: 'Ping',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
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

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Text(
                          'Exclusive Offers',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 0, 19, 48),
                        child: Row(
                          spacing: 8,
                          children: [
                            _buildExclsiveOfferItem(
                              'assets/pictures/hp_pictures/exclusive_offers_pictures/sanFransiscoDiscount.png',
                            ),
                            _buildExclsiveOfferItem(
                              'assets/pictures/hp_pictures/exclusive_offers_pictures/dreamTravelDiscounts.jpg',
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Text(
                          'Trending Packages',
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
                      padding: const EdgeInsets.only(top: 5, bottom: 131),
                      child: SizedBox(
                        height: 406,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          scrollDirection: Axis.horizontal,
                          itemCount: _getPackageItems().length,
                          itemBuilder: (context, index) {
                            final packageData = _getPackageItems()[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index < _getPackageItems().length - 1
                                    ? 12
                                    : 0,
                              ),
                              child: PackageItemWidget(
                                iconPath: packageData['iconPath']!,
                                packageName: packageData['packageName']!,
                                countryFlagPath:
                                    packageData['countryFlagPath']!,
                                countryCityName:
                                    packageData['countryCityName']!,
                                dateOrDuration: packageData['dateOrDuration']!,
                                price: packageData['price']!,
                                avatarShape: packageData['avatarShape'] as int,
                                avatarPath: packageData['avatarPath']!,
                                providerName: packageData['providerName']!,
                                providerRating: packageData['providerRating']!,
                                onPressed: () {},
                              ),
                            );
                          },
                        ),
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

  Widget _buildExclsiveOfferItem(String imagePath) {
    return SizedBox(
      width: 344,
      height: 144,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  ////////

  List<Map<String, dynamic>> _getPackageItems() {
    return [
      {
        'iconPath': 'assets/pictures/hp_pictures/historicalKorea.jpg',
        'packageName': 'Historical Korea',
        'countryFlagPath': 'assets/Icons/hp_icons/flags/southKoreaFlag.svg',
        'countryCityName': 'Seoul, Korea',
        'dateOrDuration': '5 Days | 4 Nights',
        'price': '100',
        'avatarShape': 1,
        'avatarPath': 'assets/pictures/hp_pictures/islaAvatar.png',
        'providerName': 'May Green',
        'providerRating': '4.9',
      },
      {
        'iconPath': 'assets/pictures/hp_pictures/coldplayConcert.jpg',
        'packageName': 'Coldplay Concert',
        'countryFlagPath': 'assets/Icons/hp_icons/flags/germanyFlag.svg',
        'countryCityName': 'Munich, Germany',
        'dateOrDuration': '25th June',
        'price': '100',
        'avatarShape': 2,
        'avatarPath':
            'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
        'providerName': 'Travel Online Agency',
        'providerRating': '5',
      },
      {
        'iconPath': 'assets/pictures/hp_pictures/summerInLondon.jpg',
        'packageName': 'Summer in London',
        'countryFlagPath': 'assets/Icons/hp_icons/flags/britishFlag.svg',
        'countryCityName': 'London, GP',
        'dateOrDuration': '5 Days | 8 Nights',
        'price': '100',
        'avatarShape': 2,
        'avatarPath':
            'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
        'providerName': 'Travel Online Agency',
        'providerRating': '5',
      },
      // Duplicate items for demonstration
      {
        'iconPath': 'assets/pictures/hp_pictures/historicalKorea.jpg',
        'packageName': 'Historical Korea',
        'countryFlagPath': 'assets/Icons/hp_icons/flags/southKoreaFlag.svg',
        'countryCityName': 'Seoul, Korea',
        'dateOrDuration': '5 Days | 4 Nights',
        'price': '100',
        'avatarShape': 1,
        'avatarPath': 'assets/pictures/hp_pictures/islaAvatar.png',
        'providerName': 'May Green',
        'providerRating': '4.9',
      },
      {
        'iconPath': 'assets/pictures/hp_pictures/coldplayConcert.jpg',
        'packageName': 'Coldplay Concert',
        'countryFlagPath': 'assets/Icons/hp_icons/flags/germanyFlag.svg',
        'countryCityName': 'Munich, Germany',
        'dateOrDuration': '25th June',
        'price': '100',
        'avatarShape': 2,
        'avatarPath':
            'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',
        'providerName': 'Travel Online Agency',
        'providerRating': '5',
      },
      {
        'iconPath': 'assets/pictures/hp_pictures/summerInLondon.jpg',
        'packageName': 'Summer in London',
        'countryFlagPath': 'assets/Icons/hp_icons/flags/britishFlag.svg',
        'countryCityName': 'London, GP',
        'dateOrDuration': '5 Days | 8 Nights',
        'price': '100',
        'avatarShape': 2,
        'avatarPath':
            'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png',

        'providerName': 'Travel Online Agency',
        'providerRating': '5',
      },
    ];
  }
}
