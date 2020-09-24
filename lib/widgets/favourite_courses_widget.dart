import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_fav_courses_bloc.dart';
import 'package:udemy_clone/bloc/get_my_courses_bloc.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';

class FavouriteCoursesWidget extends StatefulWidget {
  @override
  _FavouriteCoursesWidgetState createState() => _FavouriteCoursesWidgetState();
}

class _FavouriteCoursesWidgetState extends State<FavouriteCoursesWidget> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;

      var result = sharedPreferences.getString("token");

      if (result != null) {
        favCoursesBloc..getFavCourses(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoursesResponse>>(
        stream: favCoursesBloc.subject.stream,
        builder: (ctx, AsyncSnapshot<List<CoursesResponse>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data[0].error != null &&
                snapshot.data[0].error.length > 0) {
              return _errorWidget(snapshot.data[0].error);
            }
            return favWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _errorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
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

  Widget favWidget(List<CoursesResponse> data) {
    List<CoursesResponse> results = data;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
          child: Container(
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
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => CourseOverviewScreen(
                            //       course: results[index],
                            //     ),
                            //   ),
                            // );
                          },
                          child: _itemWidget2(results, index));
                    }))
          ],
        ),
      )),
    );
  }

  Widget _itemWidget2(List<CoursesResponse> data, int index) {
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
                            "${data[index].title}",
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
                            "${data[index].instructorName}",
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
                                "${data[index].price}",
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
                                  "${data[index].rating}",
                                  style: TextStyle(
                                      fontFamily: "SF Pro Display Regular",
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "(${data[index].numberOfRatings})",
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
              borderRadius: new BorderRadius.all(
                Radius.circular(10.0),
              ),
              image: DecorationImage(
                  image: NetworkImage(data[index].thumbnail),
                  fit: BoxFit.cover)),
        )
      ],
    );
  }
}
