import 'package:book_store/generated/l10n.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/data/model/on_boarding/on_boarding_screens_model.dart';
import 'package:book_store/presentation/screens/on_boarding/welcome_screen.dart';
import 'package:book_store/presentation/screens/root/root_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  List<OnBoardingScreensModel> screens = [
    OnBoardingScreensModel(
      image: "assets/images/on_boarding/on_1.png",
      title: "Discounted\nSecondhand Books",
      description: "Used and near new secondhand books at great prices.",
    ),
    OnBoardingScreensModel(
      image: "assets/images/on_boarding/on_2.png",
      title: "20 Book Grocers\nNationally",
      description: "We've successfully opened 20 stores across Australia",
    ),
    OnBoardingScreensModel(
      image: "assets/images/on_boarding/on_3.png",
      title: "Sell or Recycle Your Old Books With Us",
      description:
          "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: screens.length,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemBuilder: (context, index) {
          final page = screens[index];

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeIn,
            child: Column(
              key: ValueKey(index),
              children: [
                SizedBox(height: 90.h),

                // 🟣 Title Animation
                AnimatedSlide(
                  offset: selectedIndex == index
                      ? Offset(0, 0)
                      : const Offset(0, -0.3),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutBack,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: selectedIndex == index ? 1 : 0,
                    child: Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "kodeMono",
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                // 🟢 Description Animation
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 900),
                  opacity: selectedIndex == index ? 1 : 0,
                  child: Text(
                    page.description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(color: AppColors.primary, fontSize: 11.sp),
                  ),
                ),

                SizedBox(height: 100.h),

                // 🟠 Image Animation (Zoom In)
                AnimatedScale(
                  duration: const Duration(milliseconds: 900),
                  scale: selectedIndex == index ? 1 : 0.8,
                  curve: Curves.easeOutBack,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: selectedIndex == index ? 1 : 0,
                    child: Image.asset(page.image, height: 200.h),
                  ),
                ),

                SizedBox(height: 60.h),

                // 🔵 Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    screens.length,
                    (dotIndex) => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      width: selectedIndex == dotIndex ? 15.w : 10.w,
                      height: selectedIndex == dotIndex ? 15.h : 10.h,
                      decoration: BoxDecoration(
                        color: selectedIndex == dotIndex
                            ? AppColors.primary
                            : AppColors.primaryLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 65.h),

                // 🟣 Next Button with Fade In
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: selectedIndex == 2 ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w, left: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          height: 35.h,
                          minWidth: 50.w,
                          color: AppColors.primary,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 800,
                                ),
                                pageBuilder: (_, animation, __) =>
                                    FirebaseAuth.instance.currentUser == null
                                    ? const WelcomeScreen()
                                    : RootScreen(),
                                transitionsBuilder: (_, animation, __, child) {
                                  // نضيف تأثيرين مع بعض: Slide + Fade
                                  final slideAnimation =
                                      Tween<Offset>(
                                        begin: const Offset(
                                          0,
                                          1,
                                        ), // يبدأ من أسفل الشاشة
                                        end: Offset.zero,
                                      ).animate(
                                        CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOutCubic,
                                        ),
                                      );

                                  final fadeAnimation =
                                      Tween<double>(begin: 0, end: 1).animate(
                                        CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeIn,
                                        ),
                                      );

                                  return SlideTransition(
                                    position: slideAnimation,
                                    child: FadeTransition(
                                      opacity: fadeAnimation,
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },

                          child: Text(
                            S.of(context).Next_button,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "kodeMono",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
