import 'package:flutter/material.dart';

class FieldLayout extends StatelessWidget {
  final IconData? icon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? obscure;

  const FieldLayout({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscure,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 0.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Center(
              child: TextField(
                obscureText: obscure ?? false,
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
                  hintText: hintText,
                  labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
