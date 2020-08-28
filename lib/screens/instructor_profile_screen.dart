import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class InstructorProfileScreen extends StatefulWidget {
  @override
  _InstructorProfileScreenState createState() =>
      _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF393A),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 35,
          ),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
        //
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20),
              icon: Icon(Icons.search),
              onPressed: () {}),
        ],
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SingleChildScrollView(
      child: Container(
          color: Color(0xFFF3F5F5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TabBar(
                labelStyle: TextStyle(
                    //up to your taste
                    fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label, //makes it better
                labelColor: Color(0xff1a73e8), //Google's sweet blue
                unselectedLabelColor: Color(0xff5f6368), //niceish grey
                isScrollable: true, //up to your taste
                indicator: MD2Indicator(
                    //it begins here
                    indicatorHeight: 3,
                    indicatorColor: Color(0xff1a73e8),
                    indicatorSize: MD2IndicatorSize
                        .normal //3 different modes tiny-normal-full
                    ),
                tabs: <Widget>[
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Personal info",
                  ),
                  Tab(
                    text: "Data & personalization",
                  ),
                  Tab(
                    text: "Security",
                  )
                ],
              ),
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
                        padding: EdgeInsets.only(top: 30, left: 5, right: 5),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    left: 35,
                                                    right: 10,
                                                    top: 10,
                                                  ),
                                                  child: Text(
                                                    "Harison Willioms replied to your question on Design Course, Lecture 5.",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "SF Pro Display Regular",
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF262626)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    left: 35,
                                                    right: 10,
                                                    top: 5,
                                                  ),
                                                  child: Text(
                                                    "12:29 pm",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "SF Pro Display Regular",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF969696)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  // Container(
                                  //   margin: EdgeInsets.all(10),
                                  //   height: 100,
                                  //   width: 150,
                                  //   decoration: new BoxDecoration(
                                  //       shape: BoxShape.rectangle,
                                  //       color: Color(0xFFA2A2A2),
                                  //       borderRadius: new BorderRadius.all(
                                  //         Radius.circular(10.0),
                                  //       )),
                                  // )
                                ],
                              );
                            }))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
