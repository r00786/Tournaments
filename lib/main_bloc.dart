import 'package:bloc/bloc.dart';
import 'package:tournaments/main_bloc_data_source.dart';
import 'package:tournaments/main_bloc_states.dart';

import 'main_bloc_events.dart';

///Main Bloc
class MainBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  ///Data Source for main bloc
  final MainDataSource _mainDataSource;

  MainBloc(this._mainDataSource);

  ///Initial State when the loading will be true
  @override
  AuthenticationState get initialState => AuthenticationState(false, true);

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState state, AuthenticationEvent event) async* {
    ///Checking if the user is logged in from cache
    yield AuthenticationState(await _mainDataSource.isLoggedIn(), false);
  }

  ///Firing Event to check if the user is logged in or not
  void checkForLogin() {
    dispatch(AuthenticationEvent());
  }
}
