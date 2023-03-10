import 'package:flutter/material.dart';
import 'package:mobile/constants/constant.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Function()? onTap;
  final bool isColor;

  CustomButton({
    super.key,
    this.buttonText,
    this.onTap,
    this.isColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: isColor ? null : Border.all(color: Colors.black),
            // ignore: dead_code
            color: isColor ? const Color(0xff2EBA64) : Color(0xFFDEE4EB)),
        child: Center(
          child: Text(
            buttonText!,
            style:TextStyle(
              fontSize: 14,
              color:!isColor?Colors.black: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
