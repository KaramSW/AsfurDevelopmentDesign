import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/provider/google_sign_in.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../navBar/nav_bar_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLoginState(
    GoogleSignInProvider googleSignInProvider,
  ) async {
    if (googleSignInProvider.isUserLoggedIn) {
      return true;
    }
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _checkLoginState(googleSignInProvider),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          // cheking if future is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(), // loading indicator
              ),
            );
          }
          // Error handeling
          else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          }
          // handel future result
          else {
            final isLoggedIn = snapshot.data ?? false; // Get the boolean result
            return isLoggedIn ? const NavBarMain() : const LoginScreen();
          }
        },
      ),
    );
  }
}
