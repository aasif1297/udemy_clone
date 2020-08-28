import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF393A),
        elevation: 0,
        leading: null,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
        //
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20),
              icon: Icon(Icons.notifications_none),
              onPressed: () {}),
        ],
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF93B3B),
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              _cellItem("Sam Smith", "Edit Profile", "", true),
                              _cellItem(
                                  "View Orders", "Recent Purchases", "", true),
                              _cellItem("Ongoing Courses", "Recent Courses", "",
                                  true),
                              _cellItem("Notifications",
                                  "Enable to receive notifications", "", true),
                              _cellItem("Log-out", "", "", true),
                              _cellItem("Support", "", "", false)
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: 35,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          AssetImage('assets/images/udemy_logo.png'),
                    )),
                Positioned(
                  top: 45,
                  right: 125,
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
            )
          ],
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
