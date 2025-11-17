import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isRounded;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isRounded,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 48.h,
          decoration: BoxDecoration(
            color: widget.isRounded ? Colors.white : AppColors.primary,
            borderRadius: BorderRadius.circular(20.r),
            border: widget.isRounded
                ? Border.all(color: AppColors.primary, width: 2.dg)
                : null,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.isRounded ? AppColors.primary : Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "kodeMono",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
