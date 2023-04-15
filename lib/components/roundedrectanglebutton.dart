import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  final String displayName;
  final void Function()? function;
  final Color color;
  final Color textColor;
  const RoundedRectangleButton({
    super.key,
    required this.displayName,
    this.function,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          child: Container(
            height: 45,
            width: 230,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Center(
              child: Text(
                displayName,
                style: TextStyle(
                  fontFamily: 'AvenirNextLTPro',
                  fontSize: 18.0,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
