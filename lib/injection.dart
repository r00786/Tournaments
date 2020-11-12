import 'package:kiwi/kiwi.dart';
import 'package:tournaments/screens/login/login_bloc.dart';
import 'package:tournaments/screens/login/login_data_source.dart';

///Creating factory for all the required objects for the screens
void initKiwi() {
  Container()
      .registerFactory((c) => LoginDataSource());
  Container()
      .registerFactory((c) => LoginBloc(c.resolve()));
}
