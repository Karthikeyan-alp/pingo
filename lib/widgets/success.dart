import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../../globals/app.dart' as app;
import '../routes/route.dart';

void success(BuildContext context) {
  final RoutePage routePage = RoutePage();

  Dialogs.materialDialog(
      barrierDismissible: false,
      msg: 'User created successfully',
      title: "Success",
      color: Colors.white,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            routePage.login(context);
          },
          text: 'OK',
          iconData: Icons.check,
          color: app.buttonColor,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}
