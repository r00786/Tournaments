import 'package:bloc/bloc.dart';
import 'package:tournaments/main_bloc_data_source.dart';
import 'package:tournaments/main_bloc_states.dart';

import 'main_bloc_events.dart';

class MainBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final MainDataSource _mainDataSource;

  MainBloc(this._mainDataSource);

  @override
  AuthenticationState get initialState => AuthenticationState(false, true);

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState state, AuthenticationEvent event) async* {
    yield AuthenticationState(await _mainDataSource.isLoggedIn(), false);
  }

  void checkForLogin() {
    dispatch(AuthenticationEvent());
  }
}
