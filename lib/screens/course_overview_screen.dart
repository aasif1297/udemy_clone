import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_course_detail_by_id_bloc.dart';
import 'package:udemy_clone/bloc/get_courses_bloc.dart';
import 'package:udemy_clone/model/course_detail_response.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/screens/course_purchase_screen.dart';
import 'package:udemy_clone/screens/course_screen.dart';
import 'package:udemy_clone/screens/instructor_profile_screen.dart';

class CourseOverviewScreen extends StatefulWidget {
  final CoursesResponse course;

  const CourseOverviewScreen({Key key, this.course}) : super(key: key);
  //const CoursesByIdScreen({Key key, this.id, this.category, this.no_of_courses})
  // : super(key: key);
  @override
  _CourseOverviewScreenState createState() => _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends State<CourseOverviewScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  CourseDetailResponse _courseDetailResponse;
  var price = "";
  var token;
  bool coursePurchased = false;
  SharedPreferences sharedPreferences;
  final List<Widget> myTabs = [
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("About".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Curriculum".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Related".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
  ];
  TabController _tabController;
  ScrollController _scrollController;
  bool fixedScroll;

  @override
  void initState() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;

      var result = sharedPreferences.getString("token");

      if (result != null) {
        courseDetailByIdBloc..getCourseDetalById(widget.course.id, result);
      }
    });

    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    setState(() {
      price = (widget.course.price == "Free")
          ? "${widget.course.price}"
          : "GHC ${widget.course.price}";
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();

    super.dispose();
    courseDetailByIdBloc..dainStream();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SharedPreferences.getInstance().then((SharedPreferences sp) {
        sharedPreferences = sp;

        var result = sharedPreferences.getString("token");

        if (result != null) {
          courseDetailByIdBloc..getCourseDetalById(widget.course.id, result);
        }
      });
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFFF3939)),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _errorWidget(String error) {
    return Center(
      child: Text(
        "$error",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildTabContext3() => SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _itemWidget();
                    })),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );

  Widget _cirriculumnWidget(List<CourseDetailResponse> data) {
    List<CourseDetailResponse> results = data;
    return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: ListView.builder(
            itemCount: results[0].sections.length,
            itemBuilder: (ctx, index) {
              var sectionIndex = index;
              return Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${results[0].sections[sectionIndex].title}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Google Sans Medium",
                                  color: Color(0xFF999999)),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    results[0].sections[index].lessons.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${index + 1}.",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Google Sans Medium",
                                            color: Color(0xFFFF3939)),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${results[0].sections[sectionIndex].lessons[index].title}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily:
                                                      "Google Sans Medium",
                                                  color: Color(0xFF262626)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${results[0].sections[sectionIndex].lessons[index].duration}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "Google Sans Medium",
                                                  color: Color(0xFF969696)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ])));
            }));
  }

  _buildTabContext2() => StreamBuilder<List<CourseDetailResponse>>(
      stream: courseDetailByIdBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data[0].error != null &&
              snapshot.data[0].error.length > 0) {
            return _errorWidget(snapshot.data[0].error);
          }

          _courseDetailResponse = snapshot.data[0];

          return _cirriculumnWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _errorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      });

  _buildTabContext() => StreamBuilder(
      stream: courseDetailByIdBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data[0].error != null &&
              snapshot.data[0].error.length > 0) {
            return _errorWidget(snapshot.data[0].error);
          }

          return _aboutWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _errorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      });

  Widget _aboutWidget(List<CourseDetailResponse> data) {
    List<CourseDetailResponse> results = data;
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Google Sans Medium",
                        color: Color(0xFF262626)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${results[0].description}",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Google Sans Medium",
                        color: Color(0xFF292929)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What you will learn",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Google Sans Medium",
                        color: Color(0xFF262626)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.course.outcomes.length,
                      itemBuilder: (ctx, index) {
                        return Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "${results[0].outcomes[index]}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Google Sans Medium",
                                    color: Color(0xFF292929)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Created by",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Google Sans Medium",
                        color: Color(0xFF262626)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/udemy_logo.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${widget.course.instructorName}",
                                          style: TextStyle(
                                              color: Color(0xFF262626),
                                              fontSize: 18,
                                              fontFamily: "Google Sans Medium"),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "New jersey",
                                          style: TextStyle(
                                              color: Color(0xFF999999),
                                              fontSize: 14,
                                              fontFamily: "Google Sans Medium"),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: Text(
                                      "View profile",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFF5C36FF),
                                          fontSize: 14,
                                          fontFamily: "Google Sans Medium"),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "886",
                                            style: TextStyle(
                                                color: Color(0xFF292929),
                                                fontSize: 14,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          ),
                                          Text(
                                            "Subscribed",
                                            style: TextStyle(
                                                color: Color(0xFF999999),
                                                fontSize: 12,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "39",
                                            style: TextStyle(
                                                color: Color(0xFF292929),
                                                fontSize: 14,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          ),
                                          Text(
                                            "Courses",
                                            style: TextStyle(
                                                color: Color(0xFF999999),
                                                fontSize: 12,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  color: Color(0xFF80D138),
                                                ),
                                                child: Text(
                                                  "4.0",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Google Sans Medium"),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                  child: Text(
                                                "(272)",
                                                style: TextStyle(
                                                    color: Color(0xFF292929),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        "Google Sans Medium"),
                                              ))
                                            ],
                                          ),
                                          Text(
                                            "Avg. Ratings",
                                            style: TextStyle(
                                                color: Color(0xFF999999),
                                                fontSize: 12,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<CourseDetailResponse>>(
          stream: courseDetailByIdBloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data[0].error != null &&
                  snapshot.data[0].error.length > 0) {
                return _errorWidget(snapshot.data[0].error);
              }

              return _tabWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _errorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          }),
    );
  }

  Widget _tabWidget(List<CourseDetailResponse> data) {
    List<CourseDetailResponse> results = data;
    return Stack(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(widget.course.thumbnail),
                  fit: BoxFit.cover)),
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 55,
          ),
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
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.only(top: 190.0, left: 8, right: 8),
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${results[0].title}",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Google Sans Medium",
                                color: Color(0xFF262626)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InstructorProfileScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "${results[0].instructorName}",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Google Sans Medium",
                                      color: Color(0xFF969696)),
                                ),
                              )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Color(0xFF80D138),
                                  ),
                                  child: Text(
                                    "${results[0].rating.toDouble()}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Google Sans Medium",
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    "(${results[0].numberOfRatings})",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Google Sans Medium",
                                        color: Color(0xFF969696)),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Color(0xFFFF3939),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3.0,
                      unselectedLabelColor: Color(0xFF999999),
                      labelColor: Color(0xFFFF3939),
                      isScrollable: false,
                      tabs: myTabs,
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContext(),
                _buildTabContext2(),
                _buildTabContext3(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 60,
            child: Container(
                color: Colors.white,
                child: Row(children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text("$price",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Google Sans Medium",
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (!results[0].isPurchased) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => CoursePurchaseScreen(
                                        course_id: results[0].id,
                                      )),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: (results[0].isPurchased == false)
                                ? Color(0xFFFF3939)
                                : Colors.grey[400],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                              (results[0].isPurchased == false)
                                  ? "Enroll Now"
                                  : "Purchased",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Google Sans Medium",
                                color: Colors.white,
                              )),
                        ),
                      ))
                ])),
          ),
        ),
      ],
    );
  }

  Widget _itemWidget() {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Card(
              elevation: 15,
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
                            left: 35,
                            right: 15,
                            top: 15,
                          ),
                          child: Text(
                            "UX Design - From Wireframe to Prototype logo UX Design",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF616161)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 35,
                            right: 10,
                            top: 5,
                          ),
                          child: Text(
                            "Jerry Gerige",
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF969696)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 35, right: 10, top: 20, bottom: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "\$25.00",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display Regular",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF969696)),
                              )),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color(0xFF80D03C),
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontFamily: "SF Pro Display Regular",
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "(125)",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display Regular",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF969696)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 23.8),
          height: 100,
          width: 150,
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
