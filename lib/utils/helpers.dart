import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tournaments/screens/login/login_screen.dart';
import 'package:tournaments/screens/tournaments/tournaments.dart';

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

final Map<String, WidgetBuilder> authenticatedRoutes = {
  '/': (context) => TournamentsWidget(), // default for logged In
};

final Map<String, WidgetBuilder> authPendingRoutes = {
  '/': (context) => LoginWidget(), // default for logged In
  '/tournaments': (context) => TournamentsWidget(),
};
