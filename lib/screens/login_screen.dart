import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Center(
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
              height: 40,
            ),
            _textField(context, "Enter username", null,
                TextInputType.emailAddress, false),
            SizedBox(
              height: 10,
            ),
            _textField(context, "Enter password", null,
                TextInputType.visiblePassword, true),
          ],
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
          prefixIcon: Icon(Icons.pages),
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
