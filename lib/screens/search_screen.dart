import 'package:flutter/material.dart';
import 'package:udemy_clone/model/top_categories.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _searchList = [
    "Food photography cources",
    "UI/Ux Designing cources",
    "How to create mock up in psd"
  ];

  List<TopCategories> _topCategoryList = [
    new TopCategories("Design", "125 Courses"),
    new TopCategories("Development", "199 Courses"),
    new TopCategories("Fitness", "112 Courses"),
    new TopCategories("Business", "221 Courses"),
    new TopCategories("Photography", "221 Courses"),
    new TopCategories("Music", "221 Courses"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              hintText: 'Search for course, instructor, topic etc.',
              hintStyle: TextStyle(
                  fontFamily: "SF Pro Display Regular",
                  color: Color(0xFFC7C7C7),
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Top Searches",
              style: TextStyle(
                fontFamily: "SF Pro Display Regular",
                fontSize: 20,
                color: Color(0xFF333333),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _searchList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "${_searchList[index]}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFA7A7A7),
                        fontFamily: "SF Pro Display Regular"),
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Top Categories",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: "SF Pro Display Regular",
                        fontSize: 20),
                  ),
                ),
                Container(
                    child: Text(
                  "View All",
                  style: TextStyle(
                      color: Color(0xFFFF3939),
                      fontFamily: "SF Pro Display Regular",
                      fontSize: 18),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 1.7,
              ),
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xFFA2A2A2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_topCategoryList[index].courseCategoryTitle}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            "${_topCategoryList[index].totalCourses}",
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              itemCount: _topCategoryList.length,
            ),
          )
        ],
      )),
    );
  }
}
