import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../widgets/favorites_package_item_widget.dart';
import 'package:flutter_projects/widgets/back_button.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../widgets/favorites_loading_pakcage.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Future<List<Map<String, dynamic>>> _packageItemsFuture;

  @override
  void initState() {
    super.initState();
    _packageItemsFuture = _getPackageItems();
  }

  Future<List<Map<String, dynamic>>> _getPackageItems() async {
    var headers = {
      'Authorization':
          'Bearer 9389|5ttedFaxkfoXue6wPdVhYWnWwH2gCqCWdXewPo0t3e9de3a0',
    };
    var dio = Dio();
    var response = await dio.request(
      'https://staging.asfur.mvp-apps.ae/api/consumer/favorites/list?limit=10',
      options: Options(method: 'GET', headers: headers),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((item) {
        // Find the English translation for the package name
        final englishPackageTranslation = (item['package_translations'] as List)
            .firstWhere((t) => t['locale'] == 'en', orElse: () => null);

        // Find the English translation for the travel agency name
        final englishAgencyTranslation =
            (item['travel_agency']['agency_translations'] as List).firstWhere(
              (t) => t['locale'] == 'en',
              orElse: () => null,
            );

        // Get the cover image
        final coverImage = item['cover'] != null
            ? item['cover']['virtual_path']
            : '';

        // Determine the duration text
        final dateOrDuration = item['valid_till'] != null
            ? item['valid_till'].toString().split('T')[0] // Get date part
            : '${item['number_of_days']} Days | ${item['number_of_nights']} Nights';

        return {
          'iconPath': coverImage,
          'packageName': englishPackageTranslation?['title'] ?? 'N/A',
          'countryFlagPath':
              'https://flagcdn.com/144x108/ae.png', // Default flag as the API doesn't provide a flag URL for countries (only cities) and the example response had 'country' as null.
          'countryCityName': item['city']['name'] ?? 'N/A',
          'dateOrDuration': dateOrDuration,
          'price': item['selling_price']?.toString() ?? '0',
          'avatarShape':
              2, // Assuming avatar shape is always 2 for agency avatars
          'avatarPath':
              'assets/pictures/hp_pictures/travelOnlineAgencyAvatar.png', // Assuming a default avatar path
          'providerName': englishAgencyTranslation?['name'] ?? 'N/A',
          'providerRating': '5', // Defaulting to 5
        };
      }).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              children: [
                CustomBackButtonIcon(),
                SizedBox(width: 18),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontFamily: 'Ping',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 24, 34, 48),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _packageItemsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      alignment: Alignment.topCenter,
                      child: Shimmer(child: FavoritesLoadingPakcage()),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'No internet connection, please connect to the internet to view your favorite packages!',
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No favorite packages found.'));
                  } else {
                    final packageItems = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      scrollDirection: Axis.vertical,
                      itemCount: packageItems.length,
                      itemBuilder: (context, index) {
                        final packageData = packageItems[index];
                        return FavPackWidget(
                          iconPath: packageData['iconPath']!,
                          packageName: packageData['packageName']!,
                          countryFlagPath: packageData['countryFlagPath']!,
                          countryCityName: packageData['countryCityName']!,
                          dateOrDuration: packageData['dateOrDuration']!,
                          price: packageData['price']!,
                          avatarShape: packageData['avatarShape'] as int,
                          avatarPath: packageData['avatarPath']!,
                          providerName: packageData['providerName']!,
                          providerRating: packageData['providerRating']!,
                          onPressed: () {},
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
