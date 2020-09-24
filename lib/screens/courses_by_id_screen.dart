import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:udemy_clone/bloc/get_courses_bloc.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';
import 'package:udemy_clone/screens/notifications_screen.dart';
import 'package:udemy_clone/screens/search_screen.dart';

class CoursesByIdScreen extends StatefulWidget {
  final String id;
  final String category;
  final int no_of_courses;

  const CoursesByIdScreen({Key key, this.id, this.category, this.no_of_courses})
      : super(key: key);

  @override
  _CoursesByIdScreenState createState() => _CoursesByIdScreenState();
}

class _CoursesByIdScreenState extends State<CoursesByIdScreen>
    with TickerProviderStateMixin {
  bool displayMyWidget = true;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    coursesBloc..getCoursesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF393A),
        elevation: 0,
        leading: null,
        title: Text(
          "${widget.category} Courses",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
        actions: [
          IconButton(
              icon: Image.asset(
                "assets/images/filter.png",
                height: 19,
                width: 19,
              ),
              onPressed: () {
                _filterWidget();
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              }),
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ),
                );
              })
        ],
      ),
      body: (widget.no_of_courses > 0)
          ? StreamBuilder<List<CoursesResponse>>(
              stream: coursesBloc.subjectById.stream,
              builder: (ctx, AsyncSnapshot<List<CoursesResponse>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data[0].error != null &&
                      snapshot.data[0].error.length > 0) {
                    return _errorWidget(snapshot.data[0].error);
                  }
                  return _mainWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return _errorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget();
                }
              })
          : _errorWidget("No Courses Available"),
    );
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

  _filterWidget() => Container(
        child: AnimatedContainer(
          // Use the properties stored in the State class.
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          // Define how long the animation should take.
          duration: Duration(seconds: 1),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
        ),
      );

  Widget _mainWidget(List<CoursesResponse> data) {
    List<CoursesResponse> results = data;
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
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: results.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      screen: CourseOverviewScreen(
                                        course: results[index],
                                      ),
                                      withNavBar:
                                          false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: _itemWidget(results, index));
                            }))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _fav_item() {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Card(
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
                            right: 10,
                            top: 10,
                          ),
                          child: Text(
                            "UX Design - From Wireframe to Prototype logo UX Design",
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 14,
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
                            left: 35,
                            right: 10,
                            top: 20,
                          ),
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
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              )),
            )),
        Container(
          margin: EdgeInsets.all(10),
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

  Widget _itemWidget(List<CoursesResponse> results, int index) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Card(
              elevation: 2,
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
                            "${results[index].title}",
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
                            "${results[index].instructorName}",
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
                                "${results[index].price}",
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
                                  "${results[index].rating}",
                                  style: TextStyle(
                                      fontFamily: "SF Pro Display Regular",
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "(${results[index].numberOfRatings})",
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
              ),
              image: DecorationImage(
                  image: NetworkImage(results[index].thumbnail),
                  fit: BoxFit.cover)),
        )
      ],
    );
  }
}
