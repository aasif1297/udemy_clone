import 'package:flutter/material.dart';
import 'package:udemy_clone/bloc/get_categories_bloc.dart';
import 'package:udemy_clone/model/categories_response.dart';
import 'package:udemy_clone/screens/courses_by_id_screen.dart';

class TopCategoriesWidget extends StatefulWidget {
  @override
  _TopCategoriesWidgetState createState() => _TopCategoriesWidgetState();
}

class _TopCategoriesWidgetState extends State<TopCategoriesWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesBloc..getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriesResponse>>(
        stream: categoriesBloc.subject.stream,
        builder: (ctx, AsyncSnapshot<List<CategoriesResponse>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data[0].error != null &&
                snapshot.data[0].error.length > 0) {
              return _errorWidget(snapshot.data[0].error);
            }
            return _freeWidget(snapshot.data);
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

  Widget _freeWidget(List<CategoriesResponse> _list) {
    List<CategoriesResponse> results = _list.take(5).toList();
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: results.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ActionChip(
                label: Text(
                  '${results[index].name}',
                  style: TextStyle(
                      fontFamily: "SF Pro Display Regular",
                      fontSize: 12,
                      color: Color(0xFF484747)),
                ),
                backgroundColor: Color(0xFFE1E1E1),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CoursesByIdScreen(
                            id: results[index].id,
                            category: results[index].name,
                            no_of_courses: results[index].numberOfCourses,
                          )));
                }),
          );
        },
      ),
    );
  }
}
