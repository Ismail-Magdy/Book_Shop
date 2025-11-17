import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/cart/cart_store.dart';

class CustomWidgetHistoryScreen extends StatelessWidget {
  final String image;
  final String title;
  final String auther;
  final String details;

  const CustomWidgetHistoryScreen({
    super.key,
    required this.image,
    required this.title,
    required this.auther,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: 115.w,
              height: 140.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      fontFamily: "kodeMono",
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    auther,
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                      fontFamily: "kodeMono",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AnimatedRatingStars(
                    initialRating: 4.5,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Colors.amber,
                    emptyColor: Colors.grey,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border,
                    onChanged: (double rating) {},
                    displayRatingValue: true,
                    interactiveTooltips: true,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 10.sp,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    readOnly: false,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    details,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.sp,
                      fontFamily: "kodeMono",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      // Add To Cart
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        minWidth: 90.w,
                        height: 30.h,
                        color: AppColors.primary,
                        textColor: Colors.white,
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "kodeMono",
                          ),
                        ),
                        onPressed: () {
                          // Add To Cart
                          CartStore.addItem(title, image);
                          // SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.white,
                              elevation: 7.h,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40.w,
                                vertical: 10.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColors.primary,
                                    size: 26.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      "$title added to cart",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "kodeMono",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      //
                      SizedBox(width: 11.w),
                      // Add To Wish
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        minWidth: 90.w,
                        height: 30.h,
                        color: Colors.white,
                        textColor: AppColors.text,
                        child: Text(
                          "Add To Wish",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "kodeMono",
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
