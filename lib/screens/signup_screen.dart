import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
import 'package:udemy_clone/screens/intro_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      backgroundColor: Color(0xFFFFFFFF),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
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
                  "assets/images/udemy_logo.png",
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sign up with your email address",
                style: TextStyle(
                    fontFamily: "SF Pro Display Regular",
                    fontSize: 18,
                    color: Color(0xFF999999)),
              ),
              SizedBox(
                height: 40,
              ),
              _textField(context, "Full Name", null, TextInputType.emailAddress,
                  false, 12),
              SizedBox(
                height: 10,
              ),
              _textField(context, "Enter password", null,
                  TextInputType.visiblePassword, true, 12),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _textField(context, "Enter username", null,
                          TextInputType.emailAddress, false, 0),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: _textField(context, "Enter password", null,
                          TextInputType.visiblePassword, true, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
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
                      "Sign in",
                      style: TextStyle(
                          fontFamily: "SF Pro Display Regular",
                          color: Color(0xFFFFF4F4)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OnBoardingPage(),
                        ),
                      );
                    }),
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
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already registered?",
                      style: TextStyle(
                          fontFamily: "SF Pro Display Regular",
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      " Sign in now",
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
              Text(
                "Terms \& Conditions",
                style: TextStyle(
                    fontFamily: "SF Pro Display Regular",
                    fontSize: 12,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
      BuildContext context,
      String text,
      TextEditingController controller,
      TextInputType type,
      bool obscure,
      double margin) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
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
}
