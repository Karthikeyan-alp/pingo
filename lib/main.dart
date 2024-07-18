// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pingo/globals/theme.dart';
import 'package:pingo/routes/route.dart';
import './globals/colors.dart' as colors;
import './globals/app.dart' as app;
import 'package:flutter/material.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.grey,
      disabledColor: Colors.black,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RoutePage routePage = RoutePage();
  int inc =0;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(inc == 0){
      changeTheme();
      routePage.loginRedirect(context);
      inc++;
    }

    return Scaffold(
        backgroundColor: app.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.shopping_cart,size: 100,color: app.text,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(app.appName,
                        speed: const Duration(milliseconds: 100),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 3,
                            color: app.text)),
                  ]),
            )
          ],
        ));
  }
}
