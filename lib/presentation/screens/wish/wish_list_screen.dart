import 'package:book_store/data/model/wish/history_list_model.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/widgets/wish/custom_widget_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  //
  List<HistoryListModel> historyList = [
    HistoryListModel(
      image: "assets/images/History/1.jpg",
      title: "The Heart of Hell",
      auther: "Mitch Weiss",
      details:
          "The untold story of courage and\nsacrifice in the shadow of Iwo Jima.",
    ),
    HistoryListModel(
      image: "assets/images/History/2.jpg",
      title: "Adrennes 1944",
      auther: "Antony Beevor",
      details: "#1 international bestseller and award\nwinning history book.",
    ),
    HistoryListModel(
      image: "assets/images/History/3.jpg",
      title: "War on the Gothic Line",
      auther: "Christian Jennings",
      details:
          "Through the eyes of thirteen men and\nwomen from seven different nations ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "kodeMono",
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: ListView.separated(
          itemCount: historyList.length,
          separatorBuilder: (_, __) => SizedBox(height: 5.h),
          itemBuilder: (context, index) {
            final item = historyList[index];
            return CustomWidgetHistoryScreen(
              image: item.image,
              title: item.title,
              auther: item.auther,
              details: item.details,
            );
          },
        ),
      ),
    );
  }
}
