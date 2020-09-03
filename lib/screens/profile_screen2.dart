import 'package:flutter/material.dart';

class ProfileScreen2 extends StatefulWidget {
  @override
  _ProfileScreen2State createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
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
          "Edit Profile",
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
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 35,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage('assets/images/udemy_logo.png'),
                    )),
                Positioned(
                  top: 45,
                  right: 130,
                  child: InkWell(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Icon(
                        Icons.camera_alt,
                        color: Color(0xFFFF393A),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _textField("First Name"),
          _textField("Last Name"),
          _textField("Email"),
          _textField("Facebook Link"),
          _textField("Twitter Link"),
          _textField("LinkedIn Link"),
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
                  "Update Profile",
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

  Widget _cellItem(
      String title, String subtitle, String icon_path, bool show_divider) {
    return Container(
      padding: EdgeInsets.only(left: 18),
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.supervised_user_circle),
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                        fontFamily: "SF Pro Display Regular",
                        fontSize: 18,
                        color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  (subtitle.length == 0)
                      ? Text(
                          "$subtitle",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 11,
                              color: Color(0xFF969696)),
                        )
                      : Align(
                          child: Text(
                            "$subtitle",
                            style: TextStyle(
                                fontFamily: "SF Pro Display Regular",
                                fontSize: 11,
                                color: Color(0xFF969696)),
                          ),
                        ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (show_divider)
              ? Divider(
                  height: 2,
                  color: Colors.red,
                )
              : Container(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
