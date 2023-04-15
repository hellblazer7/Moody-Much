import 'package:flutter/material.dart';

class HomeScreenRowWidget extends StatelessWidget {
  final Color color;
  final String title;
  final void Function()? function;
  final String contentLine1;
  final String contentLine2;
  const HomeScreenRowWidget({
    super.key,
    required this.color,
    required this.title,
    this.function,
    required this.contentLine1,
    required this.contentLine2,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 98,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'AvenirNextLTPro',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF263238),
                  ),
                ),
                Text(
                  contentLine1,
                  style: const TextStyle(
                    fontFamily: 'AvenirNextLTPro',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  contentLine2,
                  style: const TextStyle(
                    fontFamily: 'AvenirNextLTPro',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
