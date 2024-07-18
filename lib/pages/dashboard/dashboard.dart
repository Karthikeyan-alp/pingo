// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pingo/pages/dashboard/dashboard_ui.dart';
import '../../globals/app.dart' as app;
import '../../requests/all.dart';
import '../../routes/route.dart';
import '../loading.dart';
import '../products/products.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool loading = true;
  bool content = true;
  int inc=0;
  List productList = [];
  final RoutePage routePage = RoutePage();





  connect() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      var parameter = {};
      var finalData = await getRequest("https://dummyjson.com/products", parameter);
      final value = await json.decode(finalData);
      productList = value['products'];
      print(productList.length);
      setState(() {
        loading = false;
        content = true;
      });

    }
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async {
      await remoteConfig.activate();
      setState(() {
        app.withoutDiscount = remoteConfig.getBool("withoutdiscount");
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    if(inc==0){
      connect();
      inc++;
    }
    return PopScope(
        canPop: false,
        child:Scaffold(
      backgroundColor: app.background,
      appBar: AppBar(
        backgroundColor: app.buttonColor,
        leading: const Icon(Icons.shopping_cart,color: Colors.white),
        title: Text(app.appName,style: const TextStyle(color: Colors.white,fontFamily: "Poppins")),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(onTap:(){routePage.settings(context);},child: const Icon(Icons.settings,color: Colors.white,)),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(visible: loading, child: const Center(child: LoadingBar())),
            const SizedBox(height: 20,),
            Visibility(visible:content, child: Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: DashboardUI(productList: productList),
            ))
          ],
        ),
      ),
    ));
  }
}
