import 'package:flutter/material.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';
import 'package:udemy_clone/screens/courseoverview_2.dart';
import 'package:udemy_clone/widgets/favourite_courses_widget.dart';
import 'package:udemy_clone/widgets/my_completed_courses_widget.dart';
import 'package:udemy_clone/widgets/my_ongoing_course_widget.dart';

class MyCoursesScreen extends StatefulWidget {
  @override
  MyCoursesScreenState createState() => MyCoursesScreenState();
}

class MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Favourites".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Ongoing".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Completed".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    )
  ];
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                color: Color(0xFFFF3939),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Color(0xFFFF3939),
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: false,
                  tabs: myTabs,
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          children: [
            FavouriteCoursesWidget(),
            MyOnGoingCourseWidget(),
            MyCompletedCoursesWidget()
          ],
        ),
      ),
    ));
  }
}
