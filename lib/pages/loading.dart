import 'package:flutter/material.dart';
import '../../globals/app.dart' as app;


class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 200),
          child:  SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: app.buttonColor,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 5, top: 40),
            child:  Text("Loading",style: TextStyle(color: app.text,fontFamily: "Poppins",letterSpacing: 1,fontWeight: FontWeight.w600),)),
      ],
    );;
  }
}
