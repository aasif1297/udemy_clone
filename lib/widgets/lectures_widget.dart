import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_all_sections_bloc.dart';
import 'package:udemy_clone/model/my_courses_response.dart';
import 'package:udemy_clone/model/save_course_response.dart';
import 'package:udemy_clone/model/sections.dart';
import 'package:udemy_clone/repository/repository.dart';

class LecturesWidget extends StatefulWidget {
  final MyCoursesResponse courseDetailResponse;

  const LecturesWidget({Key key, this.courseDetailResponse}) : super(key: key);
  @override
  _LecturesWidgetState createState() => _LecturesWidgetState();
}

class _LecturesWidgetState extends State<LecturesWidget> {
  SharedPreferences sharedPreferences;
  bool _loading = false;
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;

      var result = sharedPreferences.getString("token");

      if (result != null) {
        allSectionsBloc..getAllSections(widget.courseDetailResponse.id, result);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    allSectionsBloc.dainStream();
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
  Widget build(BuildContext context) {
    return StreamBuilder<List<Sections>>(
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

  Widget _mainWidget(List<Sections> data) {
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
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    ],
                                  );
                                }),
                          ])));
            }));
  }
}
