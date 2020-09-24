import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_all_sections_bloc.dart';
import 'package:udemy_clone/model/course_detail_response.dart';
import 'package:udemy_clone/model/my_courses_response.dart';
import 'package:udemy_clone/model/save_course_response.dart';
import 'package:udemy_clone/model/sections.dart';
import 'package:udemy_clone/repository/repository.dart';
import 'package:udemy_clone/screens/review_screen.dart';
import 'package:udemy_clone/widgets/lectures_widget.dart';
import 'package:udemy_clone/widgets/my_ongoing_course_widget.dart';
import 'package:udemy_clone/widgets/videoplayer_widget.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

const html = '''
https://player.vdocipher.com/playerAssets/1.x/vdo/embed/index.html#otp=20160313versASE323ByAB2I4WeqfttRpV7fkDgjfDTju6rt7Z61QCAI0MCI1OlH&playbackInfo=eyJ2aWRlb0lkIjoiZGVjNzQ4OTY0NTU3OWE2ZDQ0NGMxZDQ4OTRlNDg5YWYifQ=="''';

class CourseScreen extends StatefulWidget {
  final MyCoursesResponse courseDetailResponse;

  const CourseScreen({Key key, this.courseDetailResponse}) : super(key: key);
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  bool webView = true;
  bool webViewJs = true;
  SharedPreferences sharedPreferences;
  final bodyGlobalKey = GlobalKey();
  String dropdownValue = 'All Lectures';
  TabController _tabController;
  ScrollController _scrollController;
  bool fixedScroll;
  String videoUrl;
  VideoPlayerController _videoPlayerController;
  bool _loading = false;
  final List<Widget> myTabs = [
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Lectures".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("Q\&A".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Text("More".toUpperCase(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
  ];

  @override
  void initState() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      var result = sharedPreferences.getString("token");
      if (result != null) {
        allSectionsBloc..getAllSections(widget.courseDetailResponse.id, result);
      }
    });
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    super.initState();
  }

  void initPlayer(String url) async {
    _videoPlayerController = VideoPlayerController.network(url);
    await _videoPlayerController.initialize();
    _videoPlayerController.setLooping(false);
    _videoPlayerController.play();
  }

  Future<SaveCourseProgressResponse> _saveCourseProgressResponse(
      String token, String id, String progress) async {
    setState(() {
      _loading = true;
    });
    var error = await MainRepository().saveCourseProgress(token, id, progress);

    if (error != null) {
      setState(() {
        _loading = false;
      });

      return error;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    allSectionsBloc.dainStream();
    super.dispose();
  }

  _buildTabContext3() => Container(
          child: ListView(shrinkWrap: true, children: [
        Card(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          size: 22,
                          color: Color(0xFFFF3939),
                        ),
                        title: Text(
                          "Course Description",
                          style: TextStyle(
                              fontFamily: "Google Sans Medium",
                              fontSize: 16,
                              color: Color(0xFF262626)),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.share,
                          size: 22,
                          color: Color(0xFFFF3939),
                        ),
                        title: Text(
                          "Share this course",
                          style: TextStyle(
                              fontFamily: "Google Sans Medium",
                              fontSize: 16,
                              color: Color(0xFF262626)),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.bookmark,
                          size: 22,
                          color: Color(0xFFFF3939),
                        ),
                        title: Text(
                          "Add to Bookmark",
                          style: TextStyle(
                              fontFamily: "Google Sans Medium",
                              fontSize: 16,
                              color: Color(0xFF262626)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ReviewScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.thumb_up,
                            size: 22,
                            color: Color(0xFFFF3939),
                          ),
                          title: Text(
                            "Review this course",
                            style: TextStyle(
                                fontFamily: "Google Sans Medium",
                                fontSize: 16,
                                color: Color(0xFF262626)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.content_copy,
                          size: 22,
                          color: Color(0xFFFF3939),
                        ),
                        title: Text(
                          "View similar courses",
                          style: TextStyle(
                              fontFamily: "Google Sans Medium",
                              fontSize: 16,
                              color: Color(0xFF262626)),
                        ),
                      ),
                    ])))
      ]));

  _buildTabContext2() => Container(
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Total 114 Questions",
                            style: TextStyle(
                                fontFamily: "Google Sans Medium",
                                fontSize: 15,
                                color: Color(0xFF999999)),
                          )),
                        ],
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: Color(0xFFD7D7D7),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Lecture 5",
                            style: TextStyle(
                                fontFamily: "Google Sans Medium",
                                fontSize: 13,
                                color: Color(0xFF999999)),
                          )),
                          Text("By Ammy George",
                              style: TextStyle(
                                  fontFamily: "Google Sans Medium",
                                  fontSize: 13,
                                  color: Color(0xFF999999)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Which tool you have used in this video?",
                        style: TextStyle(
                            fontFamily: "Google Sans Medium",
                            fontSize: 16,
                            color: Color(0xFFFF3939)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "In this video when you were creating logo for Ap splash, you openned one of software. I couldn’t get any idea which software it was.?",
                        style: TextStyle(
                            fontFamily: "Google Sans Medium",
                            fontSize: 13,
                            color: Color(0xFF262626)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "28 May’18 | 12:48",
                              style: TextStyle(
                                  fontFamily: "Google Sans Medium",
                                  fontSize: 11,
                                  color: Color(0xFF999999)),
                            ),
                          ),
                          Text("Read 3 Replies",
                              style: TextStyle(
                                  fontFamily: "Google Sans Medium",
                                  fontSize: 13,
                                  color: Color(0xFFFC3838)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 2,
                      color: Color(0xFFD7D7D7),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Lecture 5",
                            style: TextStyle(
                                fontFamily: "Google Sans Medium",
                                fontSize: 13,
                                color: Color(0xFF999999)),
                          )),
                          Text("By Ammy George",
                              style: TextStyle(
                                  fontFamily: "Google Sans Medium",
                                  fontSize: 13,
                                  color: Color(0xFF999999)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Which tool you have used in this video?",
                        style: TextStyle(
                            fontFamily: "Google Sans Medium",
                            fontSize: 16,
                            color: Color(0xFFFF3939)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "In this video when you were creating logo for Ap splash, you openned one of software. I couldn’t get any idea which software it was.?",
                        style: TextStyle(
                            fontFamily: "Google Sans Medium",
                            fontSize: 13,
                            color: Color(0xFF262626)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "28 May’18 | 12:48",
                              style: TextStyle(
                                  fontFamily: "Google Sans Medium",
                                  fontSize: 11,
                                  color: Color(0xFF999999)),
                            ),
                          ),
                          Text("Read 3 Replies",
                              style: TextStyle(
                                  fontFamily: "Google Sans Medium",
                                  fontSize: 13,
                                  color: Color(0xFFFC3838)))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: CourseScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => CourseScreen(),
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF3939),
                          ),
                          alignment: Alignment.center,
                          child: Text("Ask Question",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Google Sans Medium",
                                color: Colors.white,
                              )),
                        ),
                      ))),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<List<Sections>>(
            stream: allSectionsBloc.subject.stream,
            builder: (ctx, AsyncSnapshot<List<Sections>> snapshot) {
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
            }));
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

  Widget _mainWidget(List<Sections> data) {
    videoUrl = data[1].lessons[1].videoUrl;
    initPlayer(videoUrl);
    return Stack(
      children: [
        SizedBox(
          height: 10,
        ),
        // SizedBox(
        //     height: 250,
        //     width: double.infinity,
        //     child: VideoPlayerWidget(
        //       videoPlayerController: _videoPlayerController,
        //       newKey: UniqueKey(),
        //     )),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: HtmlWidget(
              html,
              unsupportedWebViewWorkaroundForIssue37: true,
              webView: true,
              webViewJs: true,
            ),
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
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.only(top: 250.0, left: 8, right: 8),
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UX Design - Learn all From Wireframe to Prototype logo UX Design",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Google Sans Medium",
                                color: Color(0xFF262626)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "Jerry George",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Google Sans Medium",
                                    color: Color(0xFF969696)),
                              )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Color(0xFF80D138),
                                  ),
                                  child: Text(
                                    "4.5",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Google Sans Medium",
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    "(125)",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Google Sans Medium",
                                        color: Color(0xFF969696)),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
                SliverToBoxAdapter(
                  child: Container(
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
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                _lecturesBody(data),
                _buildTabContext2(),
                _buildTabContext3()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _lecturesBody(List<Sections> data) {
    List<Sections> results = data;
    return Container(
        child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (ctx, index) {
              var sectionIndex = index;
              return Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${results[sectionIndex].title}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Google Sans Medium",
                                        color: Color(0xFF999999)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: results[sectionIndex].lessons.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      _videoPlayerController.dispose();
                                      setState(() {
                                        videoUrl = results[sectionIndex]
                                            .lessons[index]
                                            .videoUrl;
                                      });

                                      // initPlayer(videoUrl);

                                      // debugPrint(videoUrl);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${index + 1}.",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Google Sans Medium",
                                              color: Color(0xFFFF3939)),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${results[sectionIndex].lessons[index].title}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        "Google Sans Medium",
                                                    color: Color(0xFF262626)),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${results[sectionIndex].lessons[index].duration}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "Google Sans Medium",
                                                    color: Color(0xFF969696)),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Checkbox(
                                            value: results[sectionIndex]
                                                .lessons[index]
                                                .isCompleted
                                                .contains("1"),
                                            activeColor: Color(0xFFFF3939),
                                            onChanged: (bool value) {
                                              print(value);
                                              if (value) {
                                                setState(() {
                                                  results[sectionIndex]
                                                      .lessons[index]
                                                      .isCompleted = "1";
                                                });

                                                _saveCourseProgressResponse(
                                                    sharedPreferences
                                                        .getString("token"),
                                                    results[sectionIndex]
                                                        .lessons[index]
                                                        .id,
                                                    "1");
                                              } else {
                                                setState(() {
                                                  results[sectionIndex]
                                                      .lessons[index]
                                                      .isCompleted = "0";
                                                });

                                                _saveCourseProgressResponse(
                                                    sharedPreferences
                                                        .getString("token"),
                                                    results[sectionIndex]
                                                        .lessons[index]
                                                        .id,
                                                    "0");
                                              }
                                            })
                                        // : _buildLoadingWidget1()
                                      ],
                                    ),
                                  );
                                }),
                          ])));
            }));
  }

  Widget _buildLoadingWidget1() {
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
}
