import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/provider/google_sign_in.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../navBar/nav_bar_main.dart';

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

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: googleSignInProvider.isUserLoggedIn
          ? const NavBarMain()
          : const LoginScreen(),
    );
  }
}
