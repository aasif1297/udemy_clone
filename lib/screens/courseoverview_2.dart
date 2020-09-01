import 'package:flutter/material.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';

class CourseOverviewScreen2 extends StatefulWidget {
  @override
  _CourseOverviewScreen2State createState() => _CourseOverviewScreen2State();
}

class _CourseOverviewScreen2State extends State<CourseOverviewScreen2>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'auto short'),
    Tab(text: 'auto long'),
    Tab(text: 'fixed'),
  ];
  TabController _tabController;
  ScrollController _scrollController;
  bool fixedScroll;

  Widget _buildCarousel() {
    return Stack(
      children: <Widget>[
        Placeholder(fallbackHeight: 100),
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: Text('Slider'))),
      ],
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    // _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _buildTabContext3() => Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return _itemWidget();
          }));

  _buildTabContext2() => Container(
          child: ListView(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Introduction to User Interface",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Google Sans Medium",
                      color: Color(0xFF999999)),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1.",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFFFF3939)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is User Interface?",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF262626)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "02:56 mins",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF969696)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2.",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFFFF3939)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is User Interface?",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF262626)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "02:56 mins",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF969696)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 2,
                  color: Color(0xFFD7D7D7),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Understanding of elements",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Google Sans Medium",
                      color: Color(0xFF999999)),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3.",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFFFF3939)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Which tool is best for UI Design?",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF262626)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "02:56 mins",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF969696)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "4.",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFFFF3939)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Which tool is best for UI Design?",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF262626)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "02:56 mins",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Google Sans Medium",
                              color: Color(0xFF969696)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ]));

  _buildTabContext() => Container(
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFF262626)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Ruis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum. dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFF292929)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What you will learn",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFF262626)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Google Sans Medium",
                                color: Color(0xFF292929)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Google Sans Medium",
                                color: Color(0xFF292929)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Google Sans Medium",
                                color: Color(0xFF292929)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Created by",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Google Sans Medium",
                          color: Color(0xFF262626)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/images/udemy_logo.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Jerry George",
                                            style: TextStyle(
                                                color: Color(0xFF262626),
                                                fontSize: 18,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "New jersey",
                                            style: TextStyle(
                                                color: Color(0xFF999999),
                                                fontSize: 14,
                                                fontFamily:
                                                    "Google Sans Medium"),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Text(
                                        "View profile",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Color(0xFF5C36FF),
                                            fontSize: 14,
                                            fontFamily: "Google Sans Medium"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "886",
                                              style: TextStyle(
                                                  color: Color(0xFF292929),
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "Google Sans Medium"),
                                            ),
                                            Text(
                                              "Subscribed",
                                              style: TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      "Google Sans Medium"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "39",
                                              style: TextStyle(
                                                  color: Color(0xFF292929),
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "Google Sans Medium"),
                                            ),
                                            Text(
                                              "Courses",
                                              style: TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      "Google Sans Medium"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    color: Color(0xFF80D138),
                                                  ),
                                                  child: Text(
                                                    "4.0",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            "Google Sans Medium"),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  "(272)",
                                                  style: TextStyle(
                                                      color: Color(0xFF292929),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Google Sans Medium"),
                                                ))
                                              ],
                                            ),
                                            Text(
                                              "Avg. Ratings",
                                              style: TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      "Google Sans Medium"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // child: ListView.builder(
        //   physics: const ClampingScrollPhysics(),
        //   itemCount: lineCount,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Text('some content');
        //   },
        // ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: myTabs,
              ),
            ),
          ];
        },
        body: Container(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTabContext(),
              _buildTabContext2(),
              _buildTabContext3()
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWidget() {
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
                              left: 35, right: 10, top: 20, bottom: 15),
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
