import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGenersContainer extends StatelessWidget {
  final List list;
  final String text;
  final Color color;
  const CustomGenersContainer({
    super.key,
    required this.list,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285.w,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          // الصف اللي فيه الصور
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              list.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    list[index],
                    width: 80.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // Title
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "kodeMono",
            ),
          ),
        ],
      ),
    );
  }
}
