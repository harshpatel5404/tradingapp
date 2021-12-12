import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tradingapp/views/screen/auth/Login/components/background.dart';
import 'package:tradingapp/views/screen/auth/Signup/components/signup_screen.dart';
import 'package:tradingapp/views/screen/components/rounded_button.dart';
import 'package:tradingapp/views/screen/components/rounded_input_field.dart';
import 'package:tradingapp/views/screen/components/text_field_container.dart';
import 'package:tradingapp/views/screen/home_screen.dart';
import 'package:tradingapp/views/widgets/input_field.dart';

import '../../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController pass = TextEditingController();
  TextEditingController cemail = TextEditingController();

  @override
  void initState() {
    super.initState();
    cemail = TextEditingController(text: '');
    pass = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              Inputfield(
                icon: Icons.email,
                obtext: false,
                con: cemail,
                name: "Email",
              ),
              Inputfield(
                obtext: true,
                icon: Icons.lock,
                con: pass,
                name: "Password",
              ),
              RoundedButton(
                text: "Sign In",
                press: () {
                  if (cemail.text == "" || pass.text == "") {
                    final snackBar = SnackBar(
                      content: Text("All fileds are required!"),
                      backgroundColor: kPrimaryColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else{




                  }

                  Get.off(const HomePage());
                },
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                onTap: () {
                  Get.offAll(SignUpScreen());
                },
                child: Text(
                  "Don't have an Account ?  Sign Up",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
