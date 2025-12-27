import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo([String msg = ""]) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    textColor: Colors.black,
    fontSize: 16,
    backgroundColor: Colors.white,
  );
}
