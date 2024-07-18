// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../../globals/app.dart' as app;
import '../../routes/route.dart';
import 'signup_controllers.dart';

class SignUpUI extends StatelessWidget {
  var signUp;
  SignUpUI({required this.signUp, super.key});




  @override
  Widget build(BuildContext context) {
    final RoutePage routePage = RoutePage();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Icon(Icons.shopping_cart, size: 100, color: app.text)),
        const SizedBox(
          height: 25,
        ),
        Text(
          app.appName,
          style: TextStyle(
              fontSize: 16,
              letterSpacing: 2,
              color: app.text,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            'Enter details to create account',textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 1,
              fontFamily: 'Poppins',
              color: app.text,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                  cursorColor: app.text,
                  maxLines: 1,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: app.text, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        color: app.text,
                      ),
                      hintText: "Enter Username",
                      hintStyle: TextStyle(fontSize: 13, color: app.text),
                      focusColor: app.text,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      )))),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                  cursorColor: app.text,
                  maxLines: 1,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: app.text, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: app.text,
                      ),
                      hintText: "Enter Email Address",
                      hintStyle: TextStyle(fontSize: 13, color: app.text),
                      focusColor: app.text,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      )))),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                  cursorColor: Colors.white,
                  maxLines: 1,
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: app.text, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.key,
                        color: app.text,
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(fontSize: 13, color: app.text),
                      focusColor: app.text,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: app.text, width: 1.0),
                      )))),
        ),
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () async {
          signUp();
          },
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                  color: app.buttonColor, borderRadius: BorderRadius.circular(20.0)),
              child: Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: app.background, fontSize: 14.0, letterSpacing: 2),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                  color: app.text,
                ),
              ),
              GestureDetector(
                  onTap: (){
                    routePage.signIn(context);
                  },
                  child: Text(" Log In",style: TextStyle(color: app.text,fontWeight: FontWeight.w800,letterSpacing: 1),))
            ],
          ),
        ),
      ],
    );
  }
}
