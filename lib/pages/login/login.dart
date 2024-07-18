// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pingo/pages/login/login_controllers.dart';
import 'package:pingo/pages/login/login_ui.dart';
import '../../auth/auth.dart';
import '../../globals/app.dart' as app;
import '../../routes/route.dart';
import '../../widgets/error.dart';
import '../../widgets/loading.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final RoutePage routePage = RoutePage();

  emptyController() {
    emailController.text = "";
    passwordController.text = "";
  }


  login() async {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      String name = "";



      progress(context, "Please wait", "Logging In");
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        if (email.isEmpty || password.isEmpty) {
          Navigator.pop(context);
          error(context, "All fields are mandatory");
        } else {
          if(password.length >= 12) {
            String res = await AuthMethod().loginUser(
                email: emailController.text, password: passwordController.text);
            var finalResponse = jsonDecode(res);

            if (finalResponse['status'] == "success") {
              try {
                print(finalResponse);
                final FirebaseFirestore fireStore = FirebaseFirestore.instance;
                final docRef = fireStore.collection("users").doc(
                    finalResponse['uid']);
                docRef.get().then(
                      (DocumentSnapshot doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    name = data['name'];
                    setState(() {
                      app.name = name;
                      app.uid = finalResponse['uid'];
                      app.email = email;
                    });
                    Navigator.pop(context);
                    emptyController();
                    progress(context, "Redirecting! Please wait", "Success");
                    routePage.dashboardRedirect(context);
                  },
                  onError: (e) => {},
                );
              }catch(e){
                Navigator.pop(context);
                emptyController();
                error(context, "Something went wrong");
              }


            } else {
              Navigator.pop(context);
              emptyController();
              error(context, "Email or Password wrong");
            }
          }else{
            Navigator.pop(context);
            emptyController();
            error(context, "Email or Password wrong");
          }
        }
      }else {
        Navigator.pop(context);
        error(context, "No Internet available");
      }
    }catch(e){
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
        child:Scaffold(
      backgroundColor: app.background,
      body: SafeArea(
        child: LoginUI(login: login),
      ),
    ));
  }
}
