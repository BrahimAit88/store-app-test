import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFild extends StatelessWidget {
  CustomTextFild({
    required this.onChanged,
    required this.hintText,
    this.inputType,
    super.key,
  });
  Function(String) onChanged;
  final String hintText;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
