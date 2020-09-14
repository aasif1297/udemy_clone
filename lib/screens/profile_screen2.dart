import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/bloc/get_user_detail_bloc.dart';
import 'package:udemy_clone/model/update_user_detail_repsponse.dart';
import 'package:udemy_clone/model/user_detail.dart';
import 'package:udemy_clone/repository/repository.dart';

class ProfileScreen2 extends StatefulWidget {
  @override
  _ProfileScreen2State createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  SharedPreferences sharedPreferences;
  UpdateUserDetailsResponse _updateUserDetailsResponse;
  UserDetails _userDetails;
  var token;

  TextEditingController _firstNameController,
      _lastNameController,
      _emailController,
      _facebookController,
      _twitterController,
      _linkedinController;

  bool _loading = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;

      var result = sharedPreferences.getString("token");

      if (result != null) {
        setState(() {
          token = result;
        });
        userDetailBloc..getUserDetails(result);
      }
    });
  }

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
        body: StreamBuilder<UserDetails>(
            stream: userDetailBloc.subject.stream,
            builder: (ctx, AsyncSnapshot<UserDetails> snapshot) {
              if (snapshot.hasData) {
                _userDetails = snapshot.data;

                if (_firstNameController == null) {
                  _firstNameController = TextEditingController(
                      text: (_userDetails.firstName != null)
                          ? _userDetails.firstName
                          : "");
                  _lastNameController = TextEditingController(
                      text: (_userDetails.lastName != null)
                          ? _userDetails.lastName
                          : "");
                  _emailController = TextEditingController(
                      text: (_userDetails.email != null)
                          ? _userDetails.email
                          : "");
                  _facebookController = TextEditingController(
                      text: (_userDetails.facebook != null)
                          ? _userDetails.facebook
                          : "");
                  _twitterController = TextEditingController(
                      text: (_userDetails.twitter != null)
                          ? _userDetails.twitter
                          : "");
                  _linkedinController = TextEditingController(
                      text: (_userDetails.linkedin != null)
                          ? _userDetails.linkedin
                          : "");
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

  Widget _mainWidget(UserDetails data) {
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
                    child: (data.image != null)
                        ? CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(data.image),
                          )
                        : Container()),
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
          _textField("First Name", _firstNameController),
          _textField("Last Name", _lastNameController),
          _textField("Email", _emailController),
          _textField("Facebook Link", _facebookController),
          _textField("Twitter Link", _twitterController),
          _textField("LinkedIn Link", _linkedinController),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: (!_loading)
                ? RaisedButton(
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
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });

                      var user = UserDetails(
                          id: _userDetails.id,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          biography: "",
                          facebook: _facebookController.text,
                          twitter: _twitterController.text,
                          linkedin: _linkedinController.text);
                      _updateUserDetailsResponse =
                          await MainRepository().updateUserDetails(token, user);

                      if (_userDetails.id != null &&
                          _userDetails.status == "success") {
                        setState(() {
                          _loading = false;
                        });
                        userDetailBloc.dispose();
                      } else {
                        setState(() {
                          _loading = false;
                        });
                      }

                      userDetailBloc.getUserDetails(token);
                    })
                : RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 4.0,
                          ),
                        )),
                    onPressed: () async {}),
          ),
        ],
      ),
    );
  }

  Widget _textField(String hintText, TextEditingController _controller) {
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
        child: TextFormField(
          controller: _controller,
          autofocus: false,
          keyboardType: TextInputType.multiline,
          maxLength: null,
          maxLines: null,
          minLines: 1,
          textInputAction: TextInputAction.next,
          // onFieldSubmitted: ,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          style: TextStyle(
              color: Color(0xFF000000),
              fontFamily: "SF Pro Display Regular",
              fontSize: 14),
          decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: hintText,
              labelText: hintText,
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
