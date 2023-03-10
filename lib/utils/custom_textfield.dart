import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon, prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final bool? obscureText;
  final bool isAge;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.obscureText,
    this.keyboardType, this.isAge=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        // onTap: () {
        //   //for disappearance of the keyboard by tapping on the field
        //   FocusScopeNode currentFocus = FocusScope.of(context);

        //   if (!currentFocus.hasPrimaryFocus) {
        //     currentFocus.unfocus();
        //   }
        // },
        cursorColor: const Color(0xff2EBA64),
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        textAlign: isAge? TextAlign.center:TextAlign.justify,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          hintText: hintText,
          
          
          iconColor: const Color(0xff2EBA64),
          prefixIconColor: const Color(0xff2EBA64),
          suffixIconColor: const Color(0xff2EBA64),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xff2EBA64),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xFFC3CCD6),
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2,
                color: const Color(0xFFFF0000).withOpacity(0.6),
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xFFC3CCD6),
              )),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
