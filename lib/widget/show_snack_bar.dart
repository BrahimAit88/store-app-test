import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 2,
      ),
      content: Text(message),
    ),
    snackBarAnimationStyle: AnimationStyle(
      reverseDuration: const Duration(milliseconds: 10),
      duration: const Duration(
        milliseconds: 10,
      ),
    ),
  );
}
