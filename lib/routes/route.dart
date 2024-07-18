import 'package:flutter/material.dart';
import 'package:pingo/main.dart';
import 'package:pingo/pages/dashboard/dashboard.dart';
import 'package:pingo/pages/settings/settings.dart';
import 'package:pingo/pages/signup/signup.dart';
import '../pages/login/login.dart';

class RoutePage {

  void login(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }


  void signOut(BuildContext context){
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pop(context);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => const LoginPage()), (route) => false);
    });
  }



  void loginRedirect(BuildContext context){
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (c) => const LoginPage()), (route) => false);
    });
  }

  void reload(BuildContext context){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (c) => const SettingsPage()), (route) => false);
  }

  void signUp(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SignUp();
    }));
  }

  void signIn(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }


  void dashboard(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DashboardPage();
    }));
  }

  void settings(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SettingsPage();
    }));
  }

  void dashboardRedirect(BuildContext context){
    Future.delayed(const Duration(milliseconds: 1000), ()
    {
      Navigator.pop(context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (c) => const DashboardPage()), (
          route) => false);
    });
  }


}