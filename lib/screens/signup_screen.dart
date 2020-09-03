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
                  "assets/images/480X154.png",
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
              _textField1(context, "Full Name", null,
                  TextInputType.emailAddress, false, 12),
              SizedBox(
                height: 10,
              ),
              _textField1(context, "Email address", null,
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
                      child: _textField1(context, "Create Password", null,
                          TextInputType.emailAddress, false, 0),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: _textField1(context, "Confirm Password", null,
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
                      "Sign up",
                      style: TextStyle(
                          fontSize: 18,
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
                    fontSize: 15,
                    color: Color(0xFF262626)),
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
      double margin) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Card(
        elevation: 0,
        child: TextField(
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
}
