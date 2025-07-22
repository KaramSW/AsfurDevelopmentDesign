import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_projects/widgets/back_button.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  String? termsHtml;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchTerms();
  }

  Future<void> fetchTerms() async {
    try {
      var dio = Dio();
      var response = await dio.get(
        'https://staging.asfur.mvp-apps.ae/api/public/appSetting/get-value-by-key?key=TERMS_AND_CONDITIONS',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        final value = response.data['data']['value'];
        setState(() {
          termsHtml = value;
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Failed to fetch data';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(child: Text(error!))
          : Padding(
              padding: const EdgeInsets.fromLTRB(12, 56, 12, 0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomBackButtonIcon(),
                        SizedBox(width: 18),
                        Text(
                          'Terms & conditions',
                          style: TextStyle(
                            fontFamily: 'Ping',
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 24, 34, 48),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 48),
                    Html(data: termsHtml),
                  ],
                ),
              ),
            ),
    );
  }
}
