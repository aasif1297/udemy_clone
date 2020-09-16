import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_my_courses_bloc.dart';
import 'package:udemy_clone/model/my_courses_response.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';

class MyCompletedCoursesWidget extends StatefulWidget {
  @override
  _MyCompletedCoursesWidgetState createState() =>
      _MyCompletedCoursesWidgetState();
}

class _MyCompletedCoursesWidgetState extends State<MyCompletedCoursesWidget> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;

      var result = sharedPreferences.getString("token");

      if (result != null) {
        myCoursesBloc..getMyCourses(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MyCoursesResponse>>(
        stream: myCoursesBloc.subject.stream,
        builder: (ctx, AsyncSnapshot<List<MyCoursesResponse>> snapshot) {
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

  Widget _mainWidget(List<MyCoursesResponse> data) {
    List<MyCoursesResponse> results =
        data.where((element) => element.completion == 100).toList();

    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CourseOverviewScreen(
                                          course: results[index],
                                        ),
                                      ),
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

  Widget _itemWidget(List<MyCoursesResponse> data, int index) {
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
                            "${data[index].title}",
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
                              left: 35, right: 15, top: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${data[index].completion}% Completed",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display Regular",
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF27DF0B)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 35, right: 15, top: 0, bottom: 15),
                          child: LinearProgressIndicator(
                            backgroundColor: Color(0xFFE8E8E8),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF27DF0B)),
                            value: (data[index].completion.toDouble() / 100),
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
              image: DecorationImage(
                  image: NetworkImage(data[index].thumbnail),
                  fit: BoxFit.cover),
              borderRadius: new BorderRadius.all(
                Radius.circular(10.0),
              )),
        )
      ],
    );
  }
}
