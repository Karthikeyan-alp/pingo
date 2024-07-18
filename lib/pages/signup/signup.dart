// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pingo/pages/signup/signup_controllers.dart';
import 'package:pingo/pages/signup/signup_ui.dart';
import 'package:pingo/widgets/loading.dart';
import 'package:pingo/widgets/success.dart';
import '../../auth/auth.dart';
import '../../globals/app.dart' as app;
import '../../widgets/error.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  emptyController() {
    emailController.text = "";
    passwordController.text = "";
    nameController.text = "";
  }


  signUp() async {
    progress(context, "Please wait", "Signing In");
    try {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            nameController.text.isNotEmpty &&
            emailController.text.contains('@') &&
            emailController.text.contains('.')) {
          if (passValid.hasMatch(passwordController.text) &&
              passwordController.text.length >= 12) {


            String res = await AuthMethod().signupUser(
                email: emailController.text,
                password: passwordController.text,
                name: nameController.text);
            if (res == "success") {
              Navigator.pop(context);
              success(context);
            } else {
              Navigator.pop(context);
              emptyController();
              error(context, "Account already exists");
            }
          } else {
            Navigator.pop(context);
            error(context, "Password length should be minimum 12 characters and contain minimum 1 capital,small letter, Number & Special characteristics");
          }
        } else {
          Navigator.pop(context);
          error(context, "All fields are mandatory");
        }
      } else {
        Navigator.pop(context);
        error(context, "No Internet available");
      }
    } catch (e) {
      Navigator.pop(context);
      emptyController();
      error(context, "Something went wrong");
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: app.background,
          body: SafeArea(
            child: SignUpUI(signUp: signUp),
          ),
        ));
  }
}
