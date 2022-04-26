import 'dart:async';

import 'package:flutter/material.dart';

void showTransparentDialog(BuildContext context, Widget child, {FutureOr Function(Object? value)? onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    barrierColor: Colors.white.withOpacity(0),
    pageBuilder: (context, _, __) {
      return Material(
        type: MaterialType.transparency,
        child: child,
      );
    },
  ).then(onValue ?? (_) => {});
}