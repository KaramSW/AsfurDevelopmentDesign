import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButtonIcon({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 208, 213, 221),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: SvgPicture.asset('assets/Icons/backIcon.svg'),
        onPressed: onPressed ?? () => Navigator.pop(context),
        style: const ButtonStyle(),
      ),
    );
  }
}
