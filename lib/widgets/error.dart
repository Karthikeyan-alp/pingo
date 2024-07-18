import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

void error(BuildContext context ,msg) {
  Dialogs.bottomMaterialDialog(
      msg: msg,
      title: "Error",
      color: Colors.white,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'OK',
          iconData: Icons.check,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}