import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/widgets/back_button.dart';
import 'package:flutter_projects/widgets/share_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPackageDetailsScreen extends StatefulWidget {
  const ViewPackageDetailsScreen({super.key});

  @override
  State<ViewPackageDetailsScreen> createState() =>
      _ViewPackageDetailsScreenState();
}

class _ViewPackageDetailsScreenState extends State<ViewPackageDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Reset to a default color
      ),
    );
  }

  // A function that returns a list of image paths.
  // You can replace the hardcoded list with a backend call in the future.
  List<String> _getImages() {
    // This list can have any number of items.
    return [
      'assets/pictures/hp_pictures/historicalKorea.jpg',
      'assets/pictures/hp_pictures/coldplayConcert.jpg',
      //'assets/pictures/hp_pictures/summerInLondon.jpg',
      // You can add more paths here, or remove some. The code will adapt.
    ];
  }

  Map<String, dynamic> _getPackageDetails() {
    return {
      'packageName': 'Historical Korea',
      'countryFlagPath': 'assets/Icons/hp_icons/flags/southKoreaFlag.svg',
      'countryCityName': 'Seoul, Korea',

      'overview':
          'This trip offers a deep dive into Korean culture, '
          'combining traditional experiences with modern comforts, all '
          'set against the vibrant backdrop of Seoul.',

      'dateOrDuration': '5 Days | 4 Nights',
      'price': '100',
      'avatarShape': 1,
      'avatarPath': 'assets/pictures/hp_pictures/islaAvatar.png',
      'providerName': 'May Green',
      'providerRating': '4.9',
    };
  }

  @override
  Widget build(BuildContext context) {
    // At the beginning of your build method

    final List<String> topImages = _getImages();
    double screenWidth = MediaQuery.of(context).size.width;
    final packageData = _getPackageDetails();
    String packageName = packageData['packageName'];
    String flagPath = packageData['countryFlagPath'];
    String countryCity = packageData['countryCityName'];
    String overview = packageData['overview'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 320, // Set a height for the slider
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: topImages.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              topImages[index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          topImages.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 42.67,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: _currentPage == index
                                  ? Colors
                                        .teal // Active color
                                  : Color.fromARGB(
                                      255,
                                      208,
                                      213,
                                      221,
                                    ), // Inactive color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    width: screenWidth - 24,
                    top: 56,
                    left: 24,
                    child: Row(
                      children: [
                        CustomBackButtonIcon(),
                        Spacer(),
                        ShareButton(),
                        SizedBox(width: 24),
                      ],
                    ),
                  ),
                ],
              ),

              //package data column
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      packageName,
                      style: TextStyle(
                        fontFamily: 'Ping',
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(flagPath, width: 24, height: 19),
                        SizedBox(width: 4),
                        Text(
                          countryCity,
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Overview',
                      style: TextStyle(
                        fontFamily: 'Ping',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      overview,
                      style: TextStyle(
                        fontFamily: 'Ping',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
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
}
