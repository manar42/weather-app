import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required Future<Null> Function() onTap});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 56,
          decoration: ShapeDecoration(
            color: const Color(0xff8458FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          alignment: Alignment.center,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 20, color: Colors.white),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}