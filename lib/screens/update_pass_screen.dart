import 'package:flutter/material.dart';

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
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
          "Update Password",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          _textField("Old Password"),
          _textField("New Password"),
          _textField("Confirm New Password"),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: RaisedButton(
                color: Color(0xFFFF393A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: Text(
                  "Update Password",
                  style: TextStyle(
                      fontFamily: "SF Pro Display Regular",
                      color: Color(0xFFFFF4F4)),
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget _textField(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 2.0,
        bottom: 2.0,
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextField(
          autofocus: false,
          keyboardType: TextInputType.multiline,
          maxLength: null,
          maxLines: null,
          minLines: 1,
          decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Color(0xFF999999),
                  fontFamily: "SF Pro Display Regular",
                  fontSize: 14)),
        ),
      ),
    );
  }
}
