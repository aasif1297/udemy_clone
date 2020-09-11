import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_clone/screens/all_courses_screen.dart';
import 'package:udemy_clone/screens/categories_screen.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';
import 'package:udemy_clone/screens/search_screen.dart';
import 'package:udemy_clone/widgets/free_courses_widget.dart';
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
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (index % 2 == 0) {
                          return _buildCarousel(context, index ~/ 2);
                        } else {
                          return Divider();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ]),
        ));
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: 5,
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 1),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _itemWidget(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _itemWidget(BuildContext context, int carouselIndex, int itemIndex) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 3.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 15,
                            top: 15,
                          ),
                          child: Text(
                            "UX Design - From Wireframe to Prototype logo UX Design",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF616161)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 10,
                            top: 5,
                          ),
                          child: Text(
                            "Jerry Gerige",
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF969696)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 12, right: 15, top: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "35% Completed",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display Regular",
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF93B3B)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 12, right: 15, top: 0, bottom: 15),
                          child: LinearProgressIndicator(
                            backgroundColor: Color(0xFFE8E8E8),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFF93B3B)),
                            value: 0.8,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )),
        Container(
          margin: EdgeInsets.only(left: 0, right: 10, top: 23.8),
          height: 80,
          width: 130,
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFFA2A2A2),
              borderRadius: new BorderRadius.all(
                Radius.circular(10.0),
              )),
        )
      ],
    );
  }
}
