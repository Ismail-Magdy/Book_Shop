import 'package:book_store/data/model/search/previous_searchs_model.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSecondSearchScreen extends StatefulWidget {
  const CustomSecondSearchScreen({super.key});

  @override
  State<CustomSecondSearchScreen> createState() =>
      _CustomSecondSearchScreenState();
}

class _CustomSecondSearchScreenState extends State<CustomSecondSearchScreen> {
  final TextEditingController searchController = TextEditingController();
  //
  List<PreviousSearchsModel> previousSearchs = [
    PreviousSearchsModel(text: "History"),
    PreviousSearchsModel(text: "Math"),
    PreviousSearchsModel(text: "English"),
    PreviousSearchsModel(text: "Arabic"),
  ];
  //
  List<PreviousSearchsModel> previousSecondSearchs = [
    PreviousSearchsModel(text: "Gross Anatomy"),
    PreviousSearchsModel(text: "When To Rob A Bank"),
    PreviousSearchsModel(text: "The Bite In The Apple"),
    PreviousSearchsModel(text: "The Ignorant Maestro"),
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //
      appBar: AppBar(
        toolbarHeight: 75.h,
        //
        leading: Column(
          children: [
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                cursorColor: AppColors.primary,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontFamily: "kodeMono", fontSize: 13.sp),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),
          ],
        ),
        //
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 21.h),
              Padding(
                padding: EdgeInsets.only(right: 10.w),

                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "kodeMono",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        //
        leadingWidth: 275.w,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      //
      body: Column(
        children: [
          SizedBox(height: 1.h),
          // Text Of Previous Searches
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Text(
                  "Previous Searches",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "kodeMono",
                  ),
                ),
              ],
            ),
          ),
          //
          SizedBox(height: 15.h),
          // List Of Previous Searches
          Column(
            children: [
              ...List.generate(
                searchController.text.isEmpty
                    ? previousSearchs.length
                    : previousSecondSearchs.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.search,
                        size: 15.sp,
                        color: Colors.black,
                      ),
                      //
                      SizedBox(width: 15.w),
                      //
                      Text(
                        searchController.text.isEmpty
                            ? previousSearchs[index].text
                            : previousSecondSearchs[index].text,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "kodeMono",
                        ),
                      ),
                      //
                      Spacer(),
                      //
                      searchController.text.isEmpty
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.xmark,
                                size: 15.sp,
                                color: AppColors.primary,
                              ),
                            )
                          : TextButton(
                              onPressed: () {},
                              child: Text(
                                "Times",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 13.sp,
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
          //
        ],
      ),
    );
  }
}
