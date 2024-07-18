// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pingo/widgets/loading.dart';
import '../../auth/auth.dart';
import '../../globals/app.dart' as app;
import 'package:flutter/cupertino.dart';
import '../../routes/route.dart';

class SettingsUI extends StatelessWidget {
  var changeMode;
  var darkMode;
  SettingsUI({super.key,required this.changeMode, required this.darkMode});

  @override
  Widget build(BuildContext context) {
    final RoutePage routePage = RoutePage();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings",style: TextStyle(fontFamily: "Poppins",color: app.text,fontSize: 18,fontWeight: FontWeight.w600),),
        const SizedBox(height: 40,),
        Center(child: Icon(Icons.person_4_rounded,size: 100,color: app.text,)),
        const SizedBox(height: 20,),
        Center(child: Text(app.name,style: TextStyle(fontFamily: "Poppins",fontSize: 17,fontWeight: FontWeight.w600,color: app.text),)),
        const SizedBox(height: 20,),
        Center(child: Text(app.email,style: TextStyle(fontFamily: "Poppins",fontSize: 14,fontWeight: FontWeight.w400,color: app.text),)),
        const SizedBox(height: 30,),
        Center(child: Container(width: MediaQuery.of(context).size.width*0.8,height: 1,color: app.text,)),
        const SizedBox(height: 30,),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: Card(
                color: app.buttonColor,
                child: ListTile(
                  leading: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: darkMode,
                        // activeColor: app.text,
                        trackColor: app.background,
                        onChanged: (value) {
                          changeMode();
                        },
                      )),
                  title: Text(
                    "Disable Dark Mode",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        letterSpacing: 0.5,
                        color: app.text),
                  ),
                )),
          ),
        ),
        const SizedBox(height: 20,),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: Card(
                color: app.buttonColor,
                child: ListTile(
                  onTap: () async {
                    progress(context, "Please wait", "Logging out");
                    await AuthMethod().signOut();
                    Navigator.pop(context);
                    app.email = "";
                    app.name = "";
                    app.uid = "";
                    progress(context, "Please wait! Redirecting", "Success");
                    routePage.signOut(context);

                  },
                  leading: Transform.scale(
                      scale: 0.8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.logout,color: app.text,),
                      )),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          letterSpacing: 0.5,
                          color: app.text),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
