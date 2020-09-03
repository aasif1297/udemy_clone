import 'package:flutter/material.dart';
import 'package:udemy_clone/model/top_categories.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<TopCategories> _topCategoryList = [
    new TopCategories("Design", "125 Courses"),
    new TopCategories("Business", "199 Courses"),
    new TopCategories("Development", "112 Courses"),
    new TopCategories("Photography", "221 Courses"),
    new TopCategories("Fitness", "221 Courses"),
    new TopCategories("Music", "221 Courses"),
    new TopCategories("Music", "221 Courses"),
    new TopCategories("Design", "221 Courses"),
    new TopCategories("Business", "221 Courses"),
    new TopCategories("Development", "221 Courses"),
    new TopCategories("Photography", "221 Courses"),
    new TopCategories("Fitness", "221 Courses"),
    new TopCategories("Music", "221 Courses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF393A),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Categories",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
        //
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _topCategoryList.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15, bottom: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_topCategoryList[index].courseCategoryTitle}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontFamily:
                                                  "SF Pro Display Regular",
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${_topCategoryList[index].totalCourses}",
                                          style: TextStyle(
                                              fontFamily:
                                                  "SF Pro Display Regular",
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
