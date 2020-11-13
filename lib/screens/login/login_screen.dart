import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:tournaments/screens/login/login_bloc.dart';
import 'package:tournaments/screens/login/login_state.dart';
import 'package:tournaments/utils/helpers.dart';

import 'login_bloc.dart';

///Login widget
class LoginWidget extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginWidget> {
  ///Login Business Logic Component instance
  final _loginBloc = kiwi.Container().resolve<LoginBloc>();

  ///Text Controller for the Username Field
  final _textControllerUsername = TextEditingController();

  ///Text Controller for the Password Field
  final _textControllerPass = TextEditingController();

  ///tr() with strings is used to translate them as per the selected locale
  ///StreamBuilders are used so that the whole UI is not reloaded only the
  ///required components are reloaded when required
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login'.tr()),
        ),
        // Stream Builder for the login status will handle if user is logged in or
        //not
        body: StreamBuilder<LoginStatusState>(
            stream: _loginBloc.loginStatusObs,
            builder: (context, AsyncSnapshot<LoginStatusState> snapshot) {
              if (snapshot?.data?.loginSuccess == true) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacementNamed(context, "/tournaments");
                });
                return Container();
              }
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'tournaments'.tr(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'sign_in'.tr(),
                            style: TextStyle(fontSize: 20),
                          )),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _textControllerUsername,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'user_name'.tr(),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: _textControllerPass,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'password'.tr(),
                          ),
                        ),
                      ),
                      Container(
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          //This Stream Builder is used to enable or disable
                          //the login button
                          child: StreamBuilder(
                              stream: _loginBloc.enableLogin,
                              builder: (context,
                                  AsyncSnapshot<EnableLoginButtonState>
                                      snapshot) {
                                final enableButton = snapshot.hasData &&
                                    snapshot.data.enableLoginButton;
                                return RaisedButton(
                                  textColor: enableButton
                                      ? Colors.white
                                      : Colors.white24,
                                  color: enableButton
                                      ? Colors.blue
                                      : Colors.lightBlueAccent,
                                  child: Text('login'.tr()),
                                  onPressed: () {
                                    if (enableButton) {
                                      _loginBloc.doLogin(
                                          _textControllerUsername.text,
                                          _textControllerPass.text);
                                    } else {
                                      showToast("validation".tr());
                                    }
                                  },
                                );
                              })),
                      //This Stream Builder is used to build the locale dropdown
                      StreamBuilder(
                          stream: _loginBloc.localeObs,
                          builder: (context,
                              AsyncSnapshot<ChangeLocaleState> snapshot) {
                            return snapshot.hasData
                                ? Center(
                                    child: buildLocaleDropDown(
                                        context, snapshot.data))
                                : Container();
                          })
                    ],
                  ));
            }));
  }

  ///build a dropdown if we have got the value of the selected locale or saved
  ///locale otherwise return empty container
  Container buildLocaleDropDown(
      BuildContext context, ChangeLocaleState loginState) {
    return Container(
      child: DropdownButton<String>(
        icon: Container(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Image(
            image: AssetImage("assets/images/lang.png"),
          ),
          height: 30,
          width: 30,
        ),
        iconSize: 18,
        elevation: 16,
        value: (loginState).locale,
        style: TextStyle(color: Colors.black),
        underline: Container(
          padding: EdgeInsets.only(left: 4, right: 4),
          color: Colors.transparent,
        ),
        onChanged: (String newValue) {
          final locale = newValue.split("-");
          context.locale = Locale(locale[0], locale[1]);
          _loginBloc.changeLocale(newValue);
        },
        items: <String>['en-UK', 'ja-JA']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ///Initializing the login screen
      _loginBloc.initialize();

      ///adding listener to the username field
      _textControllerUsername.addListener(() {
        _loginBloc.textChangeEvent(
            _textControllerUsername.text, _textControllerPass.text);
      });

      ///adding listener to the password field
      _textControllerPass.addListener(() {
        _loginBloc.textChangeEvent(
            _textControllerUsername.text, _textControllerPass.text);
      });
    });
  }
}
