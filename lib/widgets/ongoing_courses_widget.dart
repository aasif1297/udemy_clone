import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_my_courses_bloc.dart';
import 'package:udemy_clone/model/my_courses_response.dart';

class OnGoingCoursesWidget extends StatefulWidget {
  @override
  _OnGoingCoursesWidgetState createState() => _OnGoingCoursesWidgetState();
}

class _OnGoingCoursesWidgetState extends State<OnGoingCoursesWidget> {
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
            return _coursesWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _errorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _coursesWidget(List<MyCoursesResponse> data) {
    List<MyCoursesResponse> results = data;
    return SizedBox(
      height: 180,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index % 2 == 0) {
            return _buildCarousel(context, index ~/ 2, results);
          } else {
            return Divider();
          }
        },
      ),
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

  Widget _buildCarousel(BuildContext context, int carouselIndex,
      List<MyCoursesResponse> results) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: results.length,
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 1),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _itemWidget(context, carouselIndex, itemIndex, results);
        },
      ),
    );
  }

  Widget _itemWidget(BuildContext context, int carouselIndex, int itemIndex,
      List<MyCoursesResponse> results) {
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
                            "${results[itemIndex].title}",
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
                            "${results[itemIndex].instructorName}",
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
                                "${results[itemIndex].completion}% Completed",
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
                            value: (results[itemIndex].completion.toDouble() /
                                100),
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
              ),
              image: DecorationImage(
                  image: NetworkImage(results[itemIndex].thumbnail),
                  fit: BoxFit.cover)),
        )
      ],
    );
  }
}
