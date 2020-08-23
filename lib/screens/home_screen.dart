import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF393A),
        elevation: 0,
        leading: null,
        title: Text("All Courses"),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
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
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 30),
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: Card(
                                        child: Container(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFF616161)),
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
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xFF969696)),
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
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xFF969696)),
                                                        )),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 4),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          5)),
                                                              color: Color(
                                                                  0xFF80D03C),
                                                              shape: BoxShape
                                                                  .rectangle),
                                                          child: Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "(125)",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xFF969696)),
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
                            }))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
