import 'package:kiwi/kiwi.dart';
import 'package:tournaments/main_bloc.dart';
import 'package:tournaments/main_bloc_data_source.dart';
import 'package:tournaments/screens/login/login_bloc.dart';
import 'package:tournaments/screens/login/login_data_source.dart';

///Creating factory for all the required objects for the screens
void initKiwi() {
  Container().registerFactory((c) => LoginDataSource());
  Container().registerFactory((c) => LoginBloc(c.resolve()));
  Container().registerFactory((c) => MainDataSource());
  Container().registerFactory((c) => MainBloc(c.resolve()));
}
