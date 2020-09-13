import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_clone/screens/all_courses_screen.dart';
import 'package:udemy_clone/screens/categories_screen.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';
import 'package:udemy_clone/screens/search_screen.dart';
import 'package:udemy_clone/widgets/free_courses_widget.dart';
import 'package:udemy_clone/widgets/ongoing_courses_widget.dart';
import 'package:udemy_clone/widgets/top_categories_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _list = [
    "Design",
    "Photography",
    "Farming",
    "Law",
    "Farming",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3F5F5),
        body: SingleChildScrollView(
          child: Stack(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.all(
                    Radius.circular(15),
                  )),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      height: 40,
                      alignment: Alignment.topLeft,
                    )),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 150, left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    "UX Design - From Wireframe to Prototype logo",
                    style: TextStyle(
                        fontFamily: "SF Pro Display Regular",
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Instructor Name Here",
                        style: TextStyle(
                            fontFamily: "SF Pro Display Regular",
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: RatingBar(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFFF5A424),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      Text(
                        "4.6 (2,300)",
                        style: TextStyle(
                            fontFamily: "SF Pro Display Regular",
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Top Categories",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoriesScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 12,
                              color: Color(0xFFFF3939)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TopCategoriesWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Free Courses",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AllCoursesScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 12,
                              color: Color(0xFFFF3939)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FreeCoursesWidget(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Ongoing Courses",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            fontFamily: "SF Pro Display Regular",
                            fontSize: 12,
                            color: Color(0xFFFF3939)),
                      ),
                    ],
                  ),
                  OnGoingCoursesWidget(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
