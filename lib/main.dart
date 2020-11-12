import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tournaments/injection.dart';

import 'file:///D:/ProjectsInfield/tournaments/lib/screens/login/login_screen.dart';

void main() {
  initKiwi();
  runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: [Locale('en', 'UK'), Locale('ja', 'JA')],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LoginWidget(),
    );
  }
}
