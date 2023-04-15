import 'package:flutter/material.dart';

class InteractiveTopButton extends StatelessWidget {
  final String imageResource;
  const InteractiveTopButton({
    super.key,
    required this.imageResource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: const BoxDecoration(
        color: Color(0x4AB1AECC),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image(
          image: AssetImage(imageResource),
          height: 20,
          width: 20,
          color: const Color(0xFF1C1B1F),
        ),
      ),
    );
  }
}
