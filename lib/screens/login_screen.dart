import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/model/login_response.dart';
import 'package:udemy_clone/repository/repository.dart';
import 'package:udemy_clone/screens/intro_screen.dart';
import 'package:udemy_clone/screens/signup_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _launched;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController;
  TextEditingController _passCodeController;
  bool _loading = false;
  SharedPreferences _sharedPreferences;
  LoginResponse _loginResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passCodeController = TextEditingController();
  }

  void showInSnackBar(String value) {
    print(value);
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    ));
  }

  Future<LoginResponse> _login() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _loading = true;
    });

    var email = _emailController.text;
    var password = _passCodeController.text;

    var error = await MainRepository().login(email, password);

    if (error != null) {
      setState(() {
        _loading = false;
      });

      return error;
    }
  }

  saveUserData(LoginResponse _loginResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', _loginResponse.userId);
    prefs.setString('first_name', _loginResponse.firstName);
    prefs.setString('last_name', _loginResponse.lastName);
    prefs.setString('email', _loginResponse.email);
    prefs.setString('role', _loginResponse.role);
    prefs.setInt('validity', _loginResponse.validity);
    prefs.setString('token', _loginResponse.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFFFFFF),
      body: _mainWidget(),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _mainWidget() {
    const String toLaunch = 'https://www.google.com/';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: Image.asset(
                  "assets/images/480X154.png",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              _textField1(context, "Email address", null,
                  TextInputType.emailAddress, false, _emailController),
              SizedBox(
                height: 10,
              ),
              _textField1(context, "Password", null,
                  TextInputType.visiblePassword, true, _passCodeController),
              SizedBox(
                height: 15,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontFamily: "SF Pro Display Regular",
                              color: Color(0xFFFFF4F4)),
                        ),
                        onPressed: () async {
                          _loginResponse = await _login();
                          if (_loginResponse.validity != 0) {
                            saveUserData(_loginResponse);
                            setState(() {
                              _loading = false;
                            });
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => OnBoardingPage()),
                                (Route<dynamic> route) => false);
                          } else {
                            setState(() {
                              _loading = false;
                            });
                            showInSnackBar("Wrong Login Credentials");
                          }

                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => OnBoardingPage()),
                          //     (Route<dynamic> route) => false);
                        })
                    : RaisedButton(
                        color: Color(0xFFFF393A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                        child: SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 4.0,
                          ),
                        ),
                        onPressed: () {}),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "or",
                style: TextStyle(
                    fontFamily: "SF Pro Display Regular",
                    color: Color(0xFF9D9D9D)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: RaisedButton(
                            color: Color(0xFF3B5999),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: IconButton(
                              onPressed: null,
                              icon: Image.asset("assets/images/fb_logo.png"),
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: RaisedButton(
                            color: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: IconButton(
                              onPressed: null,
                              icon:
                                  Image.asset("assets/images/google_logo.png"),
                            ),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  )
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Not registered yet?",
                      style: TextStyle(
                          fontFamily: "SF Pro Display Regular",
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      " Sign up now",
                      style: TextStyle(
                          fontFamily: "SF Pro Display Regular",
                          fontSize: 16,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _launched = _launchInWebViewOrVC(toLaunch);
                },
                child: Text(
                  "Terms \& Conditions",
                  style: TextStyle(
                      fontFamily: "SF Pro Display Regular",
                      fontSize: 15,
                      color: Color(0xFF262626)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(BuildContext context, String text,
      TextEditingController controller, TextInputType type, bool obscure) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        obscureText: obscure,
        enabled: true,
        textInputAction: TextInputAction.next,
        autofocus: true,
        onSubmitted: (_) => (!obscure)
            ? FocusScope.of(context).nextFocus()
            : FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: "SF Pro Display Regular",
              color: Color(0xFF999999)),
          border: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            focusedGradient: LinearGradient(
              colors: <Color>[
                Color(0xFF7F00FF),
                Color(0xFFE100FF),
              ],
            ),
            unfocusedGradient: LinearGradient(
              colors: <Color>[
                Color(0xFF373B44),
                Color(0xFF4286f4),
              ],
            ),
          ),
        ),
        controller: controller,
        keyboardType: type,
        maxLines: 1,
      ),
    );
  }

  Widget _textField1(
      BuildContext context,
      String text,
      TextEditingController controller,
      TextInputType type,
      bool obscure,
      TextEditingController _controller) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 0,
        child: TextField(
          controller: _controller,
          obscureText: obscure,
          enabled: true,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => (!obscure)
              ? FocusScope.of(context).nextFocus()
              : FocusScope.of(context).unfocus(),
          autofocus: false,
          keyboardType: type,
          decoration: new InputDecoration(
              filled: true,
              fillColor: Color(0xFFF3F5F5),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: text,
              hintStyle: TextStyle(
                  color: Color(0xFF999999),
                  fontFamily: "SF Pro Display Regular",
                  fontSize: 14)),
        ),
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
