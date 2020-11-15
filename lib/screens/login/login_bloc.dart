import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tournaments/screens/login/login_event.dart';
import 'package:tournaments/screens/login/login_state.dart';

import 'login_data_source.dart';

///Business Logic Component for the Login Screen will contain the logic of the screen
class LoginBloc extends Bloc<BaseLoginEvent, LoginState> {
  ///Publish Subject for the locale
  final _localePbs = PublishSubject<ChangeLocaleState>();

  ///Observable for the locale
  Observable<ChangeLocaleState> get localeObs => _localePbs.stream;

  ///Publish Subject for the login button
  final _enableLogin = PublishSubject<EnableLoginButtonState>();

  ///Observable for the login button
  Observable<EnableLoginButtonState> get enableLogin => _enableLogin.stream;

  ///Publish Subject for the Login Status
  final _loginStatusPbs = PublishSubject<LoginStatusState>();

  ///Observable for the login status
  Observable<LoginStatusState> get loginStatusObs => _loginStatusPbs.stream;

  ///Data Source which will be responsible for getting any type of data
  final LoginDataSource loginDataSource;

  LoginBloc(this.loginDataSource);

  ///Initial State When the screen initializes
  LoginState get initialState => LoginState();

  ///All the states are been managed in this method @currentState is the parent
  ///state of all the states the states will be differentiated with their type
  ///@event are the events which will be fired by the user
  @override
  Stream<LoginState> mapEventToState(
      LoginState sate, BaseLoginEvent event) async* {
    ///if event is the Login Initialization than we will check whether the user is
    ///already logged in if so we will redirect user to next segment
    ///if user is not logged in we will get the previously selected locale if present
    ///and show it to the user on the login screen
    if (event is LoginInitialization) {
      _localePbs.sink
          .add(ChangeLocaleState(await loginDataSource.getSelectedLanguage()));
    }

    ///This event will be fired when user tries to login and it will check from
    ///the data source ig the user is present than it will return true other wise
    ///false
    else if (event is DoLoginEvent) {
      final isLoginSuccess = LoginStatusState(
          loginDataSource.login(event.username, event.password));
      ///Simulating setting error
      isLoginSuccess.errorMessage =
          isLoginSuccess.loginSuccess ? "" : "User Not Found";
      _loginStatusPbs.sink.add(isLoginSuccess);

      await loginDataSource.setLoginStatus(isLoginSuccess.loginSuccess);
    }

    ///if user changes username or password text this event will be fired which
    ///will enable/disable the login button
    else if (event is TextChangeEvent) {
      _enableLogin.sink.add(EnableLoginButtonState(
          (event.userName?.length ?? 0) > 3 &&
              (event.password?.length ?? 0) > 3));
    }

    ///if the user changes the locale of the application than this event will be
    ///fired
    else if (event is ChangeLocaleEvent) {
      loginDataSource.setLanguage(event.changedLocal);
      _localePbs.sink
          .add(ChangeLocaleState(await loginDataSource.getSelectedLanguage()));
    }
  }

  ///Will Be Called When Text Will Change In Username TextField
  textChangeEvent(String userName, String password) {
    dispatch(TextChangeEvent(userName, password));
  }

  ///Will be called on login press when the fields are validated
  doLogin(String username, String password) {
    dispatch(DoLoginEvent(username, password));
  }

  ///Closing all the streams
  closeAllStreams() {
    _localePbs.close();
    _enableLogin.close();
    _loginStatusPbs.close();
  }

  /// initializing the screen
  void initialize() {
    dispatch(LoginInitialization());
  }

  ///called when user changes locale in dropdown
  void changeLocale(String newValue) {
    dispatch(ChangeLocaleEvent(newValue));
  }
}
