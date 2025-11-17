import 'package:book_store/generated/l10n.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/auth/login_screen.dart';
import 'package:book_store/presentation/screens/auth/sign_up_screen.dart';
import 'package:book_store/presentation/widgets/on_boarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  // Animation
  void _navigateWithAnimation(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, animation, __) => page,
        transitionsBuilder: (_, animation, __, child) {
          // Slide + Fade Animation
          final slideAnimation =
              Tween<Offset>(
                begin: const Offset(0, 1), // يبدأ من أسفل الشاشة
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              );

          final fadeAnimation = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
      ),
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/images/on_boarding/welcome_bg.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Title
          Column(
            children: [
              SizedBox(height: 90.h),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Books For\nEvery Taste",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "kodeMono",
                  ),
                ),
              ),
            ],
          ),

          // Buttons Section
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: S.of(context).Login,
                onTap: () =>
                    _navigateWithAnimation(context, const LoginScreen()),
                isRounded: false,
              ),
              SizedBox(height: 23),
              CustomButton(
                text: S.of(context).SignUp,
                onTap: () =>
                    _navigateWithAnimation(context, const SignUpScreen()),
                isRounded: true,
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
