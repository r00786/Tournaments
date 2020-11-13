class AuthenticationState {
  bool _isLoggedIn;
  bool _isLoading;

  AuthenticationState(this._isLoggedIn, this._isLoading);

  bool get isLoggedIn => _isLoggedIn;

  bool get isLoading => _isLoading;
}
