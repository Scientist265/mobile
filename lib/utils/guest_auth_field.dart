import 'package:flutter/material.dart';

class GuestField extends StatelessWidget {
  final String imgPath;
  final String? text;
  final Function()? tap;
  const GuestField({
    super.key,
    required this.imgPath,
    required this.text,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Image.asset(
                  imgPath,
                  width: 32,
                  height: 32,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
