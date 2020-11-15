
///Authentication State for the user login
class AuthenticationState {
  ///Value of this field will get set by checking user login status from the cache
  bool _isLoggedIn;
  ///Will load the UI till the login status is fetched from the cache
  bool _isLoading;

  AuthenticationState(this._isLoggedIn, this._isLoading);

  bool get isLoggedIn => _isLoggedIn;

  bool get isLoading => _isLoading;
}
