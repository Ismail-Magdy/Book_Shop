import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryList extends StatelessWidget {
  final List list;

  const CustomCategoryList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          children: List.generate(
            list.length,
            (index) => Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.asset(
                        list[index].image,
                        height: 170.h,
                        width: 130.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //
                  SizedBox(height: 10.h),
                  //
                  Text(
                    maxLines: 2,
                    list[index].auther,
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "kodeMono",
                    ),
                  ),
                  //
                  SizedBox(height: 2.h),
                  //
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    list[index].title,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
