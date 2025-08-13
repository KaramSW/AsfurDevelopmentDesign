import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ShareButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 208, 213, 221),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: SvgPicture.asset('assets/Icons/shareIcon.svg'),
        onPressed: () {},
        style: const ButtonStyle(),
      ),
    );
  }
}
