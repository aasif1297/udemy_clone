import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_clone/screens/profile_screen2.dart';
import 'package:udemy_clone/screens/search_screen.dart';
import 'package:udemy_clone/screens/update_pass_Screen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F5F5),
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
          "Account Page",
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          ),
        ),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen2(),
                ),
              );
            },
            child: _itemCard("Edit Profile Settings", true)),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UpdatePasswordScreen(),
              ),
            );
          },
          child: _itemCard("Change Password", true),
        ),
        _itemCard("Course Reminder Notifications", false),
        _itemCard("General Notifications", false),
        _itemCard("Comments Notifications", false),
        _itemCard("Share App", true),
        _itemCard("Contact & Support", true),
        _itemCard("Teach a course", true),
        _itemCard("Sign-out", true),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _itemCard(String title, bool isToggle) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "$title",
                  style: TextStyle(
                      fontFamily: "SF Pro Display Regular",
                      fontSize: 14,
                      color: Color(0xFF262626)),
                ),
              ),
              (isToggle)
                  ? Icon(
                      Icons.navigate_next,
                      color: Color(0xFF7E7A7A),
                      size: 30,
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _lights = !_lights;
                        });
                      },
                      child: CupertinoSwitch(
                        activeColor: Color(0xFF1592E6),
                        value: _lights,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
                          });
                        },
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
