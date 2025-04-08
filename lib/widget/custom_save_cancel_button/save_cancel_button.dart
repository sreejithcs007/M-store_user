import 'package:flutter/material.dart';

class CustomSaveCancel extends StatelessWidget {
  const CustomSaveCancel(
      {super.key,
      required this.cancelOnPress,
      required this.saveOnPress,
      this.cancelText,
      this.saveText,
      this.cancelTextColor,
      this.saveTextColor});

  final VoidCallback cancelOnPress;
  final VoidCallback saveOnPress;
  final String? cancelText;
  final String? saveText;
  final Color? cancelTextColor;
  final Color? saveTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: cancelOnPress,
          child: Text(
            cancelText ?? 'Cancel',
            style: TextStyle(color: cancelTextColor ?? Colors.black),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 50)),
            backgroundColor: WidgetStateProperty.all(const Color(0xFFEE9700)),
            shape: WidgetStateProperty.all(
              BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                  side: const BorderSide(color: const Color(0xFFEE9700))),
            ),
          ),
          onPressed: saveOnPress,
          child: Text(
            saveText ?? 'Save',
            style: TextStyle(color: saveTextColor ?? Colors.white),
          ),
        ),
      ],
    );
  }
}
