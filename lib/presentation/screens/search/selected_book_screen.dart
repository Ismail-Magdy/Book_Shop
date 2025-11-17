import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/cart/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedBookScreen extends StatefulWidget {
  final String text;
  final String image;

  const SelectedBookScreen({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  State<SelectedBookScreen> createState() => _SelectedBookScreenState();
}

class _SelectedBookScreenState extends State<SelectedBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "kodeMono",
          ),
        ),
        centerTitle: true,
      ),
      //
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Image
              Material(
                elevation: 15.h,
                borderRadius: BorderRadius.circular(10.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    widget.image,
                    width: 220.w,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //
              SizedBox(height: 40.h),
              // Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  textAlign: TextAlign.center,
                  "Because poachers were often involved, these included tiger attacks. As a result, this situation whatever it might entail was\nnow Trush’s problem and, right away,\nhe began preparing for the\ntrip to Sobolonye.",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "kodeMono",
                  ),
                ),
              ),
              //
              SizedBox(height: 50.h),
              //Add to cart Button
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                minWidth: 200.w,
                height: 50.h,
                color: AppColors.primary,
                textColor: Colors.white,
                onPressed: () {
                  //
                  CartStore.addItem(widget.text, widget.image);
                  // SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.white,
                      elevation: 10.h,
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
                              "${widget.text} added to cart",
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
                  //
                },
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "kodeMono",
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
