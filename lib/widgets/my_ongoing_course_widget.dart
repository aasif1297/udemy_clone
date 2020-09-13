import 'package:flutter/material.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';

class MyOnGoingCourseWidget extends StatefulWidget {
  @override
  _MyOnGoingCourseWidgetState createState() => _MyOnGoingCourseWidgetState();
}

class _MyOnGoingCourseWidgetState extends State<MyOnGoingCourseWidget> {
  @override
  Widget build(BuildContext context) {
    return _mainWidget(false, "35% Completed", 0.35);
  }

  Widget _mainWidget(bool completed, String progress, double _value) {
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
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CourseOverviewScreen(),
                                      ),
                                    );
                                  },
                                  child:
                                      _itemWidget(completed, progress, _value));
                            }))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _itemWidget(bool completed, String progress, double _value) {
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
                              left: 35, right: 15, top: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "$progress",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display Regular",
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: (!completed)
                                        ? Color(0xFFF93B3B)
                                        : Color(0xFF27DF0B)),
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
                                (!completed)
                                    ? Color(0xFFF93B3B)
                                    : Color(0xFF27DF0B)),
                            value: _value,
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
