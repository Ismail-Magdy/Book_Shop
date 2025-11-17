import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/auth/login_screen.dart';
import 'package:book_store/presentation/widgets/auth/custom_app_bar.dart';
import 'package:book_store/presentation/widgets/auth/custom_text_field.dart';
import 'package:book_store/presentation/widgets/on_boarding/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstAndLastNameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Form(
          key: _key,
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
                      "SignUp",
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
              // first And LastName Text Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextField(
                  controller: firstAndLastNameController,
                  isObscure: false,
                  hint: "First & Last Name",
                  inputType: TextInputType.name,
                ),
              ),
              //
              SizedBox(height: 20.h),
              // email Text Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextField(
                  controller: emailController,
                  isObscure: false,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                ),
              ),
              //
              SizedBox(height: 20.h),
              // first And LastName Text Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextField(
                  controller: mobileController,
                  isObscure: false,
                  hint: "Mobile",
                  inputType: TextInputType.phone,
                ),
              ),
              //
              SizedBox(height: 20.h),
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
                      "Please sign me up for the monthly newsletter.",
                      style: TextStyle(
                        color: AppColors.text,
                        fontFamily: "kodeMono",
                        fontSize: 10.sp,
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
                      text: "SignUp",
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                            } else if (e.code == 'email-already-in-use') {}
                          }
                        }
                      },
                      isRounded: false,
                    )
                  : CustomButton(text: "SignUp", onTap: () {}, isRounded: true),
              //
              SizedBox(height: 170.h),
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
