import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_clone/screens/categories_screen.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF393A),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Review Course",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
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
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(15),
                                          height: 90,
                                          width: 135,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: Color(0xFFA2A2A2),
                                              borderRadius:
                                                  new BorderRadius.all(
                                                Radius.circular(10.0),
                                              )),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "UX Design - From Wireframe to Prototype logo UX Design",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display Regular",
                                                      fontSize: 14,
                                                      color: Color(0xFF5E5C5C)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Jerry Geirge",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "SF Pro Display Regular",
                                                    fontSize: 13,
                                                    color: Color(0xFF5E5C5C)),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "\$25.00",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SF Pro Display Regular",
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(children: [
                                  Card(
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 8),
                                    child: Row(children: [
                                      Text(
                                        "Choose Rating",
                                        style: TextStyle(
                                            fontFamily:
                                                "SF Pro Display Regular",
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 20),
                                          alignment: Alignment.centerRight,
                                          child: RatingBar(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 14.0,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Color(0xFFF5A424),
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ))
                                ])),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(children: [
                                  Card(
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: TextField(
                                      autofocus: false,
                                      keyboardType: TextInputType.multiline,
                                      maxLength: null,
                                      maxLines: null,
                                      minLines: 10,
                                      decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                          hintText:
                                              "Share your experience about the course ………………",
                                          hintStyle: TextStyle(
                                              fontFamily:
                                                  "SF Pro Display Regular",
                                              fontSize: 12)),
                                    ),
                                  ))
                                ]))
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Color(0xFFFF393A),
                onPressed: () {},
                child: Text(
                  "Submit Review",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SF Pro Display Regular",
                      color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
