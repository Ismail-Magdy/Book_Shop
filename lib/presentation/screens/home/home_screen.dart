import 'package:book_store/data/model/home/best_sellers_model.dart';
import 'package:book_store/data/model/home/recently_viewd_model.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/data/model/home/home_novels_model_one.dart';
import 'package:book_store/presentation/widgets/home/custom_end_drawer.dart';
import 'package:book_store/presentation/widgets/home/custom_class_for_half_circle.dart';
import 'package:book_store/presentation/widgets/home/custom_geners_container.dart';
import 'package:book_store/presentation/widgets/auth/custom_text_field.dart';
import 'package:book_store/presentation/widgets/home/custom_category_list.dart';
import 'package:book_store/presentation/widgets/home/custom_category_text.dart';
import 'package:book_store/presentation/widgets/on_boarding/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  //
  final GlobalKey<ScaffoldState> sideMenuScaffoldKey =
      GlobalKey<ScaffoldState>();
  //
  int currentIndex = 0;
  // First List
  List<HomeNovelsModelOne> novelsOne = [
    HomeNovelsModelOne(
      image: "assets/images/Featured Titles/Fatherhood.jpg",
      title: "Fatherhood",
      subTitle: "Marcus Berkmann",
    ),
    HomeNovelsModelOne(
      image: "assets/images/Featured Titles/Dissapearance of Emile Zola.jpg",
      title: "The Dissapearance\nof Emila Zola",
      subTitle: "Michael Rosen",
    ),
    HomeNovelsModelOne(
      image:
          "assets/images/Featured Titles/How To Be The Best In Time And Space.jpg",
      title: "The Time Travellers\nHandbook",
      subTitle: "Stride Lottie",
    ),
  ];
  // Best Sellers List
  List<BestSellersModel> bestSellers = [
    BestSellersModel(
      image: "assets/images/Bestselling/2020.jpg",
      auther: "Fatherhood",
      title: "by Christopher Wilson",
    ),
    BestSellersModel(
      image: "assets/images/Bestselling/In A Land Of Paper Gods.jpg",
      auther: "Land Gods",
      title: "by Rebecca Mackenzie",
    ),
    BestSellersModel(
      image: "assets/images/Bestselling/Tattletale.jpg",
      auther: "Tattletale",
      title: "by Sarah J.Noughton",
    ),
    BestSellersModel(
      image: "assets/images/Bestselling/The Zoo.jpg",
      auther: "Zoorhood",
      title: "by Charlison Marry",
    ),
  ];
  //
  List<String> geners = [
    "assets/images/Genres/Doctor Who.jpg",

    "assets/images/Genres/Slugfest.jpg",
    "assets/images/Genres/Solid State Tank Girl.jpg",
  ];
  //
  List<String> genersTwo = [
    "assets/images/Genres/Doctor Who.jpg",
    "assets/images/Genres/Illegal.jpg",

    "assets/images/Genres/Solid State Tank Girl.jpg",
  ];
  // Recently Viewed List
  List<RecentlyViewdModel> recentlyViewed = [
    RecentlyViewdModel(
      image: "assets/images/Recently Viewed/The Fatal Tree.jpg",
      auther: "The Fatal Tree",
      title: "by Jake Arnott",
    ),
    RecentlyViewdModel(
      image: "assets/images/Recently Viewed/Day Four.jpg",
      auther: "Day Four",
      title: "by Lotz,Sarah",
    ),
    RecentlyViewdModel(
      image: "assets/images/Recently Viewed/D2D.jpg",
      auther: "Door to Door",
      title: "by Edward Humes",
    ),
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // EndDrawer
      endDrawer: CustomEndDrawer(),
      //
      key: sideMenuScaffoldKey,
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Half Circle
                ClipPath(
                  clipper: CustomClassForHalfCircle(),
                  child: Container(
                    width: double.infinity,
                    height: 270.h,
                    color: AppColors.primary,
                  ),
                ),
                // Main Screen
                Column(
                  children: [
                    SizedBox(height: 45.h),
                    // Title & Icon
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Our Top Picks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "kodeMono",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              sideMenuScaffoldKey.currentState!.openEndDrawer();
                            },
                            icon: const Icon(Icons.menu),
                            color: Colors.white,
                            iconSize: 30.sp,
                          ),
                        ],
                      ),
                    ),
                    //
                    SizedBox(height: 10.h),
                    // Animation with Slider
                    CarouselSlider.builder(
                      itemCount: novelsOne.length,
                      itemBuilder: (context, index, realIndex) {
                        final novel = novelsOne[index];
                        final isActive = index == currentIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          transform: Matrix4.identity()
                            ..scale(isActive ? 1.05 : 0.9),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: isActive ? 1.0 : 0.5,
                            child: SizedBox(
                              height: 260.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Image
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
                                        novel.image,
                                        height: 150.h,
                                        width: 120.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  //
                                  SizedBox(height: 10.h),
                                  // Title
                                  Text(
                                    novel.title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.subTitle,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  //
                                  SizedBox(height: 5.h),
                                  // Auther
                                  Text(
                                    novel.subTitle,
                                    style: TextStyle(
                                      color: AppColors.text,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "kodeMono",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      //
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        height: 276.h,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        viewportFraction: 0.55,
                        enlargeFactor: 0.4,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                    //
                    // Best Sellers Text
                    CustomCategoryText(title: "BestSellers"),
                    //
                    SizedBox(height: 20.h),
                    // Best Sellers
                    CustomCategoryList(list: bestSellers),
                    //
                    SizedBox(height: 45.h),
                    // Geners Text
                    CustomCategoryText(title: "Geners"),
                    //
                    SizedBox(height: 20.h),
                    // Geners List
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: CustomGenersContainer(
                                list: geners,
                                text: "Graphic Novels",
                                color: const Color(0xFF1C4E80),
                              ),
                            ),
                            //
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: CustomGenersContainer(
                                list: genersTwo,
                                text: "Horros Novels",
                                color: const Color(0xFFC65135),
                              ),
                            ),
                            //
                          ],
                        ),
                      ),
                    ),
                    //
                    SizedBox(height: 40.h),
                    // Recently Viewed Text
                    CustomCategoryText(title: "Recently Viewed"),
                    //
                    SizedBox(height: 20.h),
                    // Recently Viewed
                    CustomCategoryList(list: recentlyViewed),
                    //
                    SizedBox(height: 50.h),
                    // Monthly Newsletter Text
                    CustomCategoryText(title: "Monthly Newsletter"),
                    //
                    SizedBox(height: 25.h),
                    // subTitle Text
                    Padding(
                      padding: EdgeInsets.only(left: 35.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            "Receive our monthly newsletter and receive updates\non new stock, books and the occasional promotion.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    SizedBox(height: 20.h),
                    // name Text Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: CustomTextField(
                        controller: _nameController,
                        isObscure: false,
                        hint: "Name",
                        inputType: TextInputType.name,
                      ),
                    ),
                    //
                    SizedBox(height: 20.h),
                    // email Text Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: CustomTextField(
                        controller: _emailController,
                        isObscure: false,
                        hint: "Email Address",
                        inputType: TextInputType.emailAddress,
                      ),
                    ),
                    //
                    SizedBox(height: 25.h),
                    // Sign Up Button
                    Padding(
                      padding: EdgeInsets.only(left: 150.w, right: 5.w),
                      child: CustomButton(
                        text: "Sign Up",
                        onTap: () {},
                        isRounded: false,
                      ),
                    ),
                    //
                    SizedBox(height: 90.h),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
