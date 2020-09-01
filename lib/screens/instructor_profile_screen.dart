import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:udemy_clone/screens/course_overview_screen.dart';
import 'package:udemy_clone/screens/course_screen.dart';

class InstructorProfileScreen extends StatefulWidget {
  @override
  _InstructorProfileScreenState createState() =>
      _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("About".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Curriculum".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    )
  ];
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  _buildTabContext2() => Container(
      child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CourseOverviewScreen(),
                        ),
                      );
                    },
                    child: _itemWidget());
              })));

  _buildTabContext() => Container(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 20),
                    child: Text(
                      "About Jerry",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SF Pro Display Regular",
                          color: Color(0xFF262626)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, covelit, sedem. Asif AliLing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis iste natus error sit voluptatem accusantium doloremqueRead more totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Asif AliLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis iste natus error sit voluptatem accusantium doloremqueRead more totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Asif AliLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis iste natus error sit voluptatem accusantium doloremqueRead more totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Asif AliLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis iste natus error sit voluptatem accusantium doloremqueRead more totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora",
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SF Pro Display Regular",
                          color: Color(0xFF262626)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 20),
                    child: Text(
                      "About Jerry",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SF Pro Display Regular",
                          color: Color(0xFF262626)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                                iconSize: 50,
                                icon: Image.asset(
                                  "assets/images/fb_circular.png",
                                ),
                                onPressed: null),
                          ),
                          Expanded(
                            child: IconButton(
                                iconSize: 50,
                                icon: Image.asset(
                                    "assets/images/twitter_circular.png"),
                                onPressed: null),
                          ),
                          Expanded(
                            child: IconButton(
                                iconSize: 50,
                                icon: Image.asset(
                                    "assets/images/youtube_circular.png"),
                                onPressed: null),
                          ),
                          Expanded(
                            child: IconButton(
                                iconSize: 50,
                                icon: Image.asset(
                                    "assets/images/linkedin_circular.png"),
                                onPressed: null),
                          ),
                          Expanded(
                            child: IconButton(
                                iconSize: 50,
                                icon: Image.asset(
                                    "assets/images/blog_circular.png"),
                                onPressed: null),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Stack(
              children: [
                SizedBox(
                  height: 10,
                ),
                Positioned(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(color: Color(0xFFFF3939)),
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          height: 40,
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        )),
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              IconButton(
                                  icon:
                                      Image.asset("assets/images/thunder.png"),
                                  onPressed: null),
                              // Icon(
                              //   Icons.enhanced_encryption,
                              //   color: Colors.white,
                              // ),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(top: 150.0, left: 8, right: 8),
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 165, right: 8),
                          child: Text(
                            "Jerry George",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "SF Pro Display Regular",
                                color: Color(0xFF262626)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 165, right: 8),
                          child: Text(
                            "New jersey",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SF Pro Display Regular",
                                color: Color(0xFF969696)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Align(
                              child: Column(
                                children: [
                                  Text(
                                    "886",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "SF Pro Display Regular",
                                        color: Color(0xFF292929)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Subscribed",
                                    style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                        fontFamily: "Google Sans Medium"),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Align(
                              child: Column(
                                children: [
                                  Text(
                                    "39",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "SF Pro Display Regular",
                                        color: Color(0xFF292929)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Courses",
                                    style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                        fontFamily: "Google Sans Medium"),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3)),
                                            color: Color(0xFF80D138),
                                          ),
                                          child: Text(
                                            "4.0",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily:
                                                  "SF Pro Display Regular",
                                              color: Colors.white,
                                            ),
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
                                              fontSize: 18,
                                              fontFamily:
                                                  "SF Pro Display Regular",
                                              color: Color(0xFF292929)),
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Avg. Ratings",
                                      style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 14,
                                          fontFamily: "Google Sans Medium"),
                                    )
                                  ],
                                ),
                              ),
                            ),
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
                          height: 5,
                        ),
                        Container(
                          color: Colors.white,
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Color(0xFFFF3939),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 3.0,
                            unselectedLabelColor: Color(0xFF999999),
                            labelColor: Color(0xFFFF3939),
                            isScrollable: false,
                            tabs: myTabs,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          color: Color(0xFFF3F5F5),
                          child: NestedScrollView(
                            controller: _scrollController,
                            headerSliverBuilder: (context, value) {
                              return [
                                SliverToBoxAdapter(child: Container()),
                              ];
                            },
                            body: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildTabContext(),
                                _buildTabContext2(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(bottom: 20),
                //   padding: const EdgeInsets.only(top: 150.0, left: 8, right: 8),
                //   child: NestedScrollView(
                //     controller: _scrollController,
                //     headerSliverBuilder: (context, value) {
                //       return [
                //         SliverToBoxAdapter(
                //           child: Container(
                //               padding: EdgeInsets.only(top: 10, left: 165),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                //                 color: Colors.white,
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     "Jerry George",
                //                     style: TextStyle(
                //                         fontSize: 18,
                //                         fontFamily: "SF Pro Display Regular",
                //                         color: Color(0xFF262626)),
                //                   ),
                //                   SizedBox(
                //                     height: 5,
                //                   ),
                //                   Text(
                //                     "New jersey",
                //                     style: TextStyle(
                //                         fontSize: 14,
                //                         fontFamily: "SF Pro Display Regular",
                //                         color: Color(0xFF969696)),
                //                   ),
                //                 ],
                //               )),
                //         ),
                //         SliverToBoxAdapter(
                //           child: Container(
                //             width: double.infinity,
                //             alignment: Alignment.center,
                //             color: Colors.white,
                //             child: TabBar(
                //               controller: _tabController,
                //               indicatorColor: Color(0xFFFF3939),
                //               indicatorSize: TabBarIndicatorSize.tab,
                //               indicatorWeight: 3.0,
                //               unselectedLabelColor: Color(0xFF999999),
                //               labelColor: Color(0xFFFF3939),
                //               isScrollable: false,
                //               tabs: myTabs,
                //             ),
                //           ),
                //         ),
                //       ];
                //     },
                //     body: TabBarView(
                //       controller: _tabController,
                //       children: [
                //         _buildTabContext(),
                //         _buildTabContext2(),
                //       ],
                //     ),
                //   ),
                // ),

                Positioned(
                    top: 100,
                    left: 50,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/udemy_logo.png'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         Container(
  //           height: 250,
  //           width: double.infinity,
  //           decoration: BoxDecoration(color: Colors.grey),
  //           child: Icon(
  //             Icons.play_circle_outline,
  //             color: Colors.white,
  //             size: 55,
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(top: 190.0, left: 8, right: 8),
  //           child: Scaffold(
  //               backgroundColor: Color(0xFFF3F5F5),
  //               appBar: AppBar(
  //                 backgroundColor: Colors.white,
  //                 leading: Container(),
  //                 bottom: TabBar(
  //                   labelPadding: EdgeInsets.symmetric(horizontal: 25),
  //                   controller: _tabController,
  //                   indicatorColor: Color(0xFFFF3939),
  //                   indicatorSize: TabBarIndicatorSize.tab,
  //                   indicatorWeight: 3.0,
  //                   unselectedLabelColor: Color(0xFF999999),
  //                   labelColor: Color(0xFFFF3939),
  //                   isScrollable: true,
  //                   tabs: [],
  //                 ),
  //               ),
  //               body: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     SizedBox(
  //                       height: (_tabController.index == 0)
  //                           ? MediaQuery.of(context).size.height * 1.5
  //                           : (_tabController.index == 1) ? 100 : 50,
  //                       child: TabBarView(
  //                         controller: _tabController,
  //                         physics: NeverScrollableScrollPhysics(),
  //                         children: [
  //                           _aboutWidget(),
  //                           _curriculumWidget(),
  //                           _relatedWidget()
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Container(
  //                       color: Colors.white,
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                               flex: 1,
  //                               child: Center(
  //                                 child: Text("GHC 25.00",
  //                                     style: TextStyle(
  //                                       fontSize: 18,
  //                                       fontFamily: "Google Sans Medium",
  //                                     )),
  //                               )),
  //                           Expanded(
  //                               flex: 2,
  //                               child: InkWell(
  //                                 onTap: () {},
  //                                 child: Container(
  //                                   padding: const EdgeInsets.symmetric(
  //                                       vertical: 15),
  //                                   decoration: BoxDecoration(
  //                                     color: Color(0xFFFF3939),
  //                                   ),
  //                                   alignment: Alignment.center,
  //                                   child: Text("Enroll Now",
  //                                       style: TextStyle(
  //                                         fontSize: 18,
  //                                         fontFamily: "Google Sans Medium",
  //                                         color: Colors.white,
  //                                       )),
  //                                 ),
  //                               )),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )),
  //         ),
  //         SafeArea(
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       child: InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Container(
  //                           alignment: Alignment.centerLeft,
  //                           child: Icon(
  //                             Icons.navigate_before,
  //                             color: Colors.white,
  //                             size: 30,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Icon(
  //                       Icons.share,
  //                       color: Colors.white,
  //                       size: 25,
  //                     ),
  //                     SizedBox(
  //                       width: 15,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 8),
  //                       child: Icon(
  //                         Icons.bookmark_border,
  //                         color: Colors.white,
  //                         size: 25,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _curriculumWidget() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Card(
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
          )),
    );
  }

  Widget _aboutWidget() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                              Radius.circular(
                                                                  3)),
                                                      color: Color(0xFF80D138),
                                                    ),
                                                    child: Text(
                                                      "4.0",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Google Sans Medium"),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    "(272)",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF292929),
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
          )),
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
