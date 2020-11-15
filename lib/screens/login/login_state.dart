///Base class for all the states of the login screen
class LoginState {}

///state for the locales
class ChangeLocaleState extends LoginState {
  String _locale;

  ///Changed Locale Value
  ChangeLocaleState(this._locale);

  String get locale => _locale;
}

///state for the locales
class EnableLoginButtonState extends LoginState {
  bool _enableLoginButton;

  ///bool indicating Button should be enabled or not
  EnableLoginButtonState(this._enableLoginButton);

  bool get enableLoginButton => _enableLoginButton;
}

///state for the login status
class LoginStatusState extends LoginState {
  bool _loginSuccess;
  String _errorMessage = "";

  ///bool indicating user should login or not
  LoginStatusState(bool loginSuccess, {String errorMessage}) {
    this._loginSuccess = loginSuccess;
    this._errorMessage = errorMessage;
  }

  bool get loginSuccess => _loginSuccess;

  String get errorMessage => _errorMessage;

  set errorMessage(String errorMessage) {
    this._errorMessage = errorMessage;
  }
}
