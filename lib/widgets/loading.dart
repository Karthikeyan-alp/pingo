import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

void progress(BuildContext context ,msg, title) {
  Dialogs.materialDialog(
    barrierDismissible: false,
    msg: msg,
    title: title,
    color: Colors.white,
    context: context,
  );
}