import 'package:flutter/material.dart';

class Utility {
  static Utility? utility;

  static Utility? getInstance() {
    if (utility == null) {
      utility = Utility();
    }
    return utility;
  }

  showAlertDialog(
      BuildContext context, String alertTitle, String alertContent) {
    AlertDialog alertDialog = AlertDialog(
        title: Text(alertTitle),
        content: Text(alertContent),
        actions: [
          TextButton(
            onPressed: (() => Navigator.pop(context)),
            child: Text('Ok'),
          )
        ]);

    showDialog(context: context, builder: ((context) => alertDialog));
  }
}
