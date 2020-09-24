import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:udemy_clone/bloc/get_all_courses_bloc.dart';
import '../model/courses_response.dart';
import '../screens/course_overview_screen.dart';

class FreeCoursesWidget extends StatefulWidget {
  @override
  _FreeCoursesWidgetState createState() => _FreeCoursesWidgetState();
}

class _FreeCoursesWidgetState extends State<FreeCoursesWidget> {
  @override
  void initState() {
    super.initState();
    allCoursesBloc..getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoursesResponse>>(
        stream: allCoursesBloc.subject.stream,
        builder: (ctx, AsyncSnapshot<List<CoursesResponse>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data[0].error != null &&
                snapshot.data[0].error.length > 0) {
              return _errorWidget(snapshot.data[0].error);
            }
            return _freeWidget(snapshot.data);
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

  Widget _freeWidget(List<CoursesResponse> _list) {
    List<CoursesResponse> results =
        _list.where((element) => element.price == "Free").toList();
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: results.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              pushNewScreen(
                context,
                screen: CourseOverviewScreen(
                  course: results[index],
                ),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => CourseOverviewScreen(
              //       course: results[index],
              //     ),
              //   ),
              // );
            },
            child: Container(
                margin: EdgeInsets.only(right: 20),
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xFFA2A2A2),
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(results[index].thumbnail),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${results[index].title}",
                      style: TextStyle(
                          fontFamily: "SF Pro Display Regular",
                          fontSize: 18,
                          color: Color(0xFF262626)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${results[index].instructorName}",
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 11,
                                color: Color(0xFF262626)),
                          ),
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
                            itemSize: 14.0,
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
                          "${results[index].rating} (${results[index].totalEnrollment})",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 11,
                              color: Color(0xFF262626)),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
