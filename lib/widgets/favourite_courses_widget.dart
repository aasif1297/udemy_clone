import 'package:flutter/material.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';

class FavouriteCoursesWidget extends StatefulWidget {
  @override
  _FavouriteCoursesWidgetState createState() => _FavouriteCoursesWidgetState();
}

class _FavouriteCoursesWidgetState extends State<FavouriteCoursesWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return favWidget();
  }

  Widget favWidget() {
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CourseOverviewScreen(),
                              ),
                            );
                          },
                          child: _itemWidget2());
                    }))
          ],
        ),
      )),
    );
  }

  Widget _itemWidget2() {
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
}
