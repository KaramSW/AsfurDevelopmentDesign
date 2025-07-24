import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/back_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 56, 24, 299),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButtonIcon(),
                  SizedBox(width: 18),
                  Text(
                    'Profile',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 74,
                    height: 74,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 234, 235, 236),
                          spreadRadius: 0,
                          blurRadius: 50,
                          offset: Offset(0, 13),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: user?.photoURL != null
                          ? Image.network(
                              user!.photoURL!,
                              fit: BoxFit.cover,
                              width: 74,
                              height: 74,
                            )
                          : SvgPicture.asset(
                              'assets/Icons/account_icons/defaultAvatar.svg',
                              fit: BoxFit.cover,
                              width: 74,
                              height: 74,
                            ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      overlayColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Edit Image',
                          style: TextStyle(
                            color: Color.fromARGB(255, 18, 109, 113),
                            fontFamily: 'Ping',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/Icons/account_icons/editProfileArrow.svg',
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
