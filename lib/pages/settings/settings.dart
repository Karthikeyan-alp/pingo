// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pingo/pages/settings/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globals/app.dart' as app;
import '../../routes/route.dart';
import '../loading.dart';
import '../../globals/colors.dart' as colors;


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final RoutePage routePage = RoutePage();
  bool loading = true;
  bool content = true;
  int inc =0;
  bool darkMode = app.darkMode;





  changeMode() async {
    if(app.darkMode){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setBool('darkMode', true);
        app.darkMode = false;
        app.text = colors.darkModeText;
        app.background = colors.darkModeBackground;
        app.cardColor = colors.darkCardColor;
        app.buttonColor = colors.buttonColor;
      });
      routePage.reload(context);
    }else{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setBool('darkMode', false);
        app.darkMode = true;
        app.text = colors.normalModeText;
        app.background = colors.normalModeBackground;
        app.cardColor = colors.lightCardColor;
        app.buttonColor = colors.buttonColor;
      });
      routePage.reload(context);
    }
  }


  connect(){
    setState(() {
      if(app.darkMode){
        darkMode = true;
      }else{
        darkMode = false;
      }

      loading = false;
      content = true;
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            child: GestureDetector(onTap:(){routePage.dashboard(context);},child: const Icon(Icons.home,color: Colors.white,)),
          )
        ],
      ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(visible: loading, child: const Center(child: LoadingBar())),
                const SizedBox(height: 20,),
                Visibility(visible:content, child:  Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: SettingsUI(changeMode: changeMode, darkMode: darkMode),
                ))
              ],
            ),
          ),
    ));
  }
}
