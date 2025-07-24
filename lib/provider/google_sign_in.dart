import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  GoogleSignInAccount? _user;
  String? _googleAccessToken;
  String? _googleIdToken;
  String? _googleServerAuthCode;

  GoogleSignInAccount? get user => _user;
  String? get googleAccessToken => _googleAccessToken;
  String? get googleIdToken => _googleIdToken;
  String? get googleServerAuthCode => _googleServerAuthCode;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;

      _googleAccessToken = googleAuth.accessToken;
      _googleIdToken = googleAuth.idToken;
      _googleServerAuthCode =
          googleAuth.serverAuthCode; // ignore: deprecated_member_use

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Google Sign-In Error: $e");
    }
  }

  bool get isUserLoggedIn => FirebaseAuth.instance.currentUser != null;

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    _user = null;
    _googleAccessToken = null;
    _googleIdToken = null;
    _googleServerAuthCode = null;
    notifyListeners();
  }
}
