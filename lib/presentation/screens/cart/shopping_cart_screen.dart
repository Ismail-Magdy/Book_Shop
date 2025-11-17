import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_store.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final items = CartStore.cartItems;

    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "kodeMono",
          ),
        ),
      ),

      // Body
      body: items.isEmpty
          ? Center(
              child: Text(
                "Cart is empty",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontFamily: "kodeMono",
                ),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  color: Colors.white,
                  elevation: 10.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Container(
                    height: 120.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    child: Row(
                      children: [
                        // Image
                        Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryLight,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              item["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //
                        SizedBox(width: 15.w),
                        // Title
                        Expanded(
                          child: Text(
                            item["title"]!,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "kodeMono",
                              color: AppColors.text,
                            ),
                          ),
                        ),
                        // Remove
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              CartStore.cartItems.removeAt(index);
                            });
                            // SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.white,
                                elevation: 10.h,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 30.w,
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
                                        "${item["title"]} removed from cart",
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
                          child: SvgPicture.asset(
                            "assets/svgs/delete.svg",
                            color: AppColors.primary,
                            height: 16.h,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        //
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
