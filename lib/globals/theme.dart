import 'package:shared_preferences/shared_preferences.dart';
import '../globals/app.dart' as app;
import '../globals/colors.dart' as colors;


changeTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? mode = prefs.getBool('darkMode');
  if(mode == null){
    await prefs.setBool('darkMode', false);
  }else{
    if(mode){
      app.darkMode = true;
    }else{
      app.darkMode = false;
    }
    if(app.darkMode){
      app.text = colors.darkModeText;
      app.background = colors.darkModeBackground;
      app.buttonColor = colors.buttonColor;
      app.cardColor = colors.darkCardColor;
    }else{
      app.text = colors.normalModeText;
      app.background = colors.normalModeBackground;
      app.buttonColor = colors.buttonColor;
      app.cardColor = colors.lightCardColor;
    }
  }
}