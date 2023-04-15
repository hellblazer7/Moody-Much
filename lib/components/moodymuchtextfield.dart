import 'package:flutter/material.dart';

class MoodyMuchTextField extends StatefulWidget {
  final String label;
  final bool validator;
  final void Function(String)? onSubmit;
  const MoodyMuchTextField({
    super.key,
    required this.label,
    this.onSubmit,
    required this.validator,
  });

  @override
  State<MoodyMuchTextField> createState() => _MoodyMuchTextFieldState();
}

class _MoodyMuchTextFieldState extends State<MoodyMuchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onSubmit,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 19.0,
          vertical: 14.0,
        ),
        floatingLabelStyle: const TextStyle(
          fontFamily: 'AvenirNextLTPro',
          fontSize: 16.0,
          color: Color(0xFF49525B),
        ),
        labelStyle: const TextStyle(
          fontFamily: 'AvenirNextLTPro',
          fontSize: 17.0,
          color: Color(0xFF49525B),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: widget.validator
                ? const Color(0xFFD6D4E4)
                : const Color(0xFFF0ADAD),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1,
              color: widget.validator
                  ? const Color(0xFFD6D4E4)
                  : const Color(0xFFF0ADAD)),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
