import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///Helper functions declared here

///Function to display a toast message @message is the message to show in the toast
void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
