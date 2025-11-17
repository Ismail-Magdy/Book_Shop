import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextSearchField extends StatelessWidget {
  final String hint;
  final Widget prefixIcon;

  final TextEditingController controller;
  final ValueChanged<String> onChanged; // ✅ تعديل هنا

  const CustomTextSearchField({
    super.key,
    required this.hint,
    required this.prefixIcon,

    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged, // ✅ هي دي اللي هتستقبل قيمة النص
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontFamily: "kodeMono", fontSize: 13.sp),
        fillColor: Colors.grey.shade300,
        filled: true,
        prefixIcon: prefixIcon,

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
