import 'package:book_store/data/model/search/books_title_model.dart';
import 'package:book_store/data/model/search/search_list_model.dart';
import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/search/selected_book_screen.dart';
import 'package:book_store/presentation/widgets/search/custom_grid_view.dart';
import 'package:book_store/presentation/widgets/search/custom_text_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndexTitle = 0;
  final TextEditingController searchController = TextEditingController();

  // Tabs
  List<BooksTitleModel> titles = [
    BooksTitleModel(title: "All"),
    BooksTitleModel(title: "Genre"),
    BooksTitleModel(title: "New Release"),
    BooksTitleModel(title: "The Arts"),
  ];

  // All Books
  List<SearchListModel> searchList = [
    SearchListModel(
      title: "Biography",
      image: "assets/images/Search/Biography.jpg",
      color: const Color.fromARGB(255, 62, 8, 8),
      category: "The Arts",
    ),
    SearchListModel(
      title: "Business",
      image: "assets/images/Search/Business.jpg",
      color: const Color.fromARGB(255, 84, 84, 82),
      category: "New Release",
    ),
    SearchListModel(
      title: "Children",
      image: "assets/images/Search/Children.jpg",
      color: const Color.fromARGB(255, 218, 85, 145),
      category: "Genre",
    ),
    SearchListModel(
      title: "Cookery",
      image: "assets/images/Search/Cookery.jpg",
      color: const Color.fromARGB(255, 63, 92, 180),
      category: "Genre",
    ),
    SearchListModel(
      title: "Fiction",
      image: "assets/images/Search/Fiction.jpg",
      color: const Color.fromARGB(255, 9, 45, 64),
      category: "New Release",
    ),
    SearchListModel(
      title: "Star Trek",
      image: "assets/images/Search/Graphic Novels.jpg",
      color: const Color.fromARGB(255, 4, 16, 7),
      category: "The Arts",
    ),
  ];

  List<SearchListModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(searchList);
  }

  void _filterBooks(int index) {
    setState(() {
      selectedIndexTitle = index;
      if (titles[index].title == "All") {
        filteredList = List.from(searchList);
      } else {
        filteredList = searchList
            .where((book) => book.category == titles[index].title)
            .toList();
      }
    });
  }

  //  البحث المباشر
  void _searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = List.from(searchList);
      } else {
        filteredList = searchList
            .where(
              (book) =>
                  book.title.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 70.h),
          //  Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextSearchField(
              controller: searchController,
              hint: "Search Books, Authors, or ISBN",
              prefixIcon: Icon(CupertinoIcons.search, color: Colors.black),

              onChanged: _searchBooks,
            ),
          ),
          //
          SizedBox(height: 25.h),
          // Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: List.generate(
                  titles.length,
                  (index) => GestureDetector(
                    onTap: () => _filterBooks(index),
                    child: AnimatedContainer(
                      duration: 300.ms,
                      curve: Curves.easeOut,
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: selectedIndexTitle == index
                            ? AppColors.primary
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: selectedIndexTitle == index
                            ? [BoxShadow(color: Colors.black26, blurRadius: 5)]
                            : [],
                      ),
                      child: Center(
                        child: Text(
                          titles[index].title,
                          style: TextStyle(
                            color: selectedIndexTitle == index
                                ? Colors.white
                                : AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: "kodeMono",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          SizedBox(height: 5.h),
          //  GridView or Empty State
          Expanded(
            child: AnimatedSwitcher(
              duration: 400.ms,
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                        "No Items Found",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: "kodeMono",
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fade(duration: 300.ms).moveY(begin: 20),
                    )
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      key: ValueKey(filteredList.hashCode),
                      padding: EdgeInsets.all(10.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .49.h,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedBookScreen(
                                text: filteredList[index].title,
                                image: filteredList[index].image,
                              ),
                            ),
                          );
                        },
                        child:
                            CustomGridView(
                                  text: filteredList[index].title,
                                  color: filteredList[index].color,
                                  image: filteredList[index].image,
                                )
                                .animate()
                                .fade(duration: 400.ms)
                                .scale(
                                  begin: const Offset(0.95, 0.95),
                                  end: const Offset(1, 1),
                                ),
                      ),
                    ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
