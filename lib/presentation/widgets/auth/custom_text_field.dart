import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscure;
  final String hint;
  final TextInputType inputType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.isObscure,
    required this.hint,
    required this.inputType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isEye = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Enter  ${widget.hint}";
        }
        // Email Verify
        if (widget.hint.toLowerCase().contains("email")) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value.trim())) {
            return "Please enter a valid email address";
          }
        }
        return null;
      },
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),

      //
      controller: widget.controller,
      cursorColor: AppColors.primary,
      keyboardType: widget.inputType,
      obscureText: widget.isObscure && !isEye,
      decoration: InputDecoration(
        suffixIcon: widget.isObscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isEye = !isEye;
                  });
                },
                icon: isEye
                    ? Icon(CupertinoIcons.eye, color: AppColors.primary)
                    : Icon(CupertinoIcons.eye_slash),
              )
            : null,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(fontFamily: "kodeMono", color: AppColors.text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
