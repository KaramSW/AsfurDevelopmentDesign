import 'package:flutter/material.dart';

class FavoritesLoadingPakcage extends StatelessWidget {
  const FavoritesLoadingPakcage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: 344,
        height: 305,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(36, 181, 181, 181),
            borderRadius: BorderRadius.circular(18.5),
          ),
        ),
      ),
    );
  }
}
