import 'package:book_store/data/model/home/side_menu_model.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/on_boarding/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({super.key});

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  late final AnimationController drawerController;
  late final Animation<Offset> drawerAnimation;

  final List<SideMenuModel> customSideMenu = [
    SideMenuModel(text: "Home", icon: CupertinoIcons.home),
    SideMenuModel(text: "Our Books", icon: CupertinoIcons.book_solid),
    SideMenuModel(text: "Our Stores", icon: Icons.store),
    SideMenuModel(text: "Careers", icon: CupertinoIcons.bag_fill),
    SideMenuModel(text: "Sell With Us", icon: CupertinoIcons.money_dollar),
    SideMenuModel(text: "News Letter", icon: CupertinoIcons.news_solid),
    SideMenuModel(text: "Pop-Up Leasing", icon: CupertinoIcons.share_solid),
    SideMenuModel(text: "Account", icon: CupertinoIcons.profile_circled),
  ];

  @override
  void initState() {
    super.initState();
    drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    drawerAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: drawerController, curve: Curves.easeOutCubic),
        );

    drawerController.forward();
  }

  @override
  void dispose() {
    drawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SlideTransition(
        position: drawerAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(280.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 90.h),
                ...List.generate(customSideMenu.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: selectedIndex == 7 ? 10.w : 0,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(right: 15.w),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: (index == 6 || index == 7)
                                  ? BorderRadius.only(
                                      bottomLeft: Radius.circular(40.r),
                                    )
                                  : null,
                              color: isSelected ? AppColors.primary : null,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12.5.h,
                                horizontal: 8.w,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedScale(
                                    scale: isSelected ? 1.05 : 1.0,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                    child: Text(
                                      customSideMenu[index].text,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.text,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "kodeMono",
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Icon(
                                    customSideMenu[index].icon,
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: (index * 70).ms)
                      .slideX(
                        begin: 0.3,
                        end: 0,
                        duration: 500.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .scaleXY(
                        begin: 0.95,
                        end: 1.0,
                        duration: 500.ms,
                        curve: Curves.easeOut,
                      );
                }),
                //
                SizedBox(height: 15.h),
                // Row
                Padding(
                  padding: EdgeInsets.only(right: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          size: 17.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Terms",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontFamily: "kodeMono",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "Privacy",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontFamily: "kodeMono",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 15.h),
                // Row
                Padding(
                  padding: EdgeInsets.only(right: 25.w),
                  child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontFamily: "kodeMono",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Icon(
                          Icons.login_outlined,
                          size: 20.sp,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
