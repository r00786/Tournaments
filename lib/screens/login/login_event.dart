///Text Change Event
class TextChangeEvent extends BaseLoginEvent {
  var _password;

  var _username;

  String get userName => _username;

  String get password => _password;

  TextChangeEvent(this._username, this._password);
}

///BaseEvent Class
class BaseLoginEvent {}

///Do Login Event
class DoLoginEvent extends BaseLoginEvent {
  String _username;
  String _password;

  DoLoginEvent(this._username, this._password);

  String get username => _username;

  String get password => _password;
}

///Event to initialize the login screen
class LoginInitialization extends BaseLoginEvent {
  LoginInitialization();
}

///Event to handle the when locale of the application is changed
class ChangeLocaleEvent extends BaseLoginEvent {
  String _changedLocale;

  /// changedLocale is the locale which will be changed from the dropdown in the
  /// login screen
  ChangeLocaleEvent(String changedLocale) {
    this._changedLocale = changedLocale;
  }

  /// getter for the changed locale value
  String get changedLocal => _changedLocale;
}
