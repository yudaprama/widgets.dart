import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/divider.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {},
        child: Dialog(
          child: Container(
            color: Colors.white,
            height: 50,
            child: cupertinoLoadingIndicator(),
          ),
        ),
      );
    },
  );
}

Widget cupertinoLoadingIndicator({String text = 'Sedang memproses...'}) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CupertinoActivityIndicator(),
        widthBox10,
        Text(text),
      ],
    ),
  );
}

void dismissLoading(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop('dialog');
}
