import 'package:flutter/material.dart';
import 'package:udemy_clone/bloc/get_categories_bloc.dart';
import 'package:udemy_clone/model/categories_response.dart';
import 'package:udemy_clone/screens/courses_by_id_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesBloc..getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          "Categories",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
        //
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: StreamBuilder<List<CategoriesResponse>>(
          stream: categoriesBloc.subject.stream,
          builder: (ctx, AsyncSnapshot<List<CategoriesResponse>> snapshot) {
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
          }),
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

  Widget _mainWidget(List<CategoriesResponse> data) {
    List<CategoriesResponse> response = data;
    if (response.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No Courses Available",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
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
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: response.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 1.7,
                              ),
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CoursesByIdScreen(
                                                  id: response[index].id,
                                                  category:
                                                      response[index].name,
                                                  no_of_courses: response[index]
                                                      .numberOfCourses,
                                                )));
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFA2A2A2),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 15, bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${response[index].name}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily:
                                                      "SF Pro Display Regular",
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "${response[index].numberOfCourses}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "SF Pro Display Regular",
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
