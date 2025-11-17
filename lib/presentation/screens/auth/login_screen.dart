import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/root/root_screen.dart';
import 'package:book_store/presentation/widgets/auth/custom_app_bar.dart';
import 'package:book_store/presentation/widgets/auth/custom_text_field.dart';
import 'package:book_store/presentation/widgets/on_boarding/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //
  final GlobalKey<FormState> _key = GlobalKey();
  //
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h),
              // Login Text
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "kodeMono",
                      ),
                    ),
                  ],
                ),
              ),
              //
              SizedBox(height: 20.h),
              // Email Text Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextField(
                  controller: emailController,
                  isObscure: false,
                  hint: "Email Address",
                  inputType: TextInputType.emailAddress,
                ),
              ),
              //
              SizedBox(height: 20.h),
              //
              // Password Text Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextField(
                  controller: passwordController,
                  isObscure: true,
                  hint: "Password",
                  inputType: TextInputType.multiline,
                ),
              ),
              //
              SizedBox(height: 10.h),
              // Row CheckBox
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.primary,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Stay Logged In",
                      style: TextStyle(
                        color: AppColors.text,
                        fontFamily: "kodeMono",
                        fontSize: 10.sp,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: AppColors.text,
                          fontFamily: "kodeMono",
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              SizedBox(height: 25.h),
              // Login Button
              isChecked
                  ? CustomButton(
                      text: "Login",
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                            } else if (e.code == 'wrong-password') {}
                          }
                        }
                      },
                      isRounded: false,
                    )
                  : CustomButton(text: "Login", onTap: () {}, isRounded: true),
              //
              SizedBox(height: 295.h),
              // Copy Right
              Text(
                "@IsmailMagdy2025",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "kodeMono",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
