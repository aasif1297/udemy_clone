import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/repository/repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CoursePurchaseScreen extends StatefulWidget {
  final String course_id;

  const CoursePurchaseScreen({Key key, this.course_id}) : super(key: key);

  @override
  _CoursePurchaseScreenState createState() => _CoursePurchaseScreenState();
}

class _CoursePurchaseScreenState extends State<CoursePurchaseScreen> {
  MainRepository _mainRepository = MainRepository();
  var url;
  SharedPreferences sharedPreferences;
  String auth_token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      auth_token = sharedPreferences.getString('token');

      if (auth_token != null) {
        setState(() {
          url =
              '${_mainRepository.course_purchase_url}${auth_token}/${widget.course_id}';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (url != null) ? _mainWidget() : _buildLoadingWidget());
  }

  Widget _mainWidget() {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
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
}
