import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:tournaments/injection.dart';
import 'package:tournaments/main_bloc_states.dart';
import 'package:tournaments/utils/helpers.dart';

import 'main_bloc.dart';

void main() {
  ///initializing all the dependencies of the widget
  initKiwi();
  ///For initializing the localization
  runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: [Locale('en', 'UK'), Locale('ja', 'JA')],
      child: MyApp()));
}

///Main App
class MyApp extends StatelessWidget {
  ///Bloc for the Main App
  final _mainBloc = kiwi.Container().resolve<MainBloc>();

  @override
  Widget build(BuildContext context) {
    ///Checking is the user is logged on or not
    _mainBloc.checkForLogin();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, Widget child) {
        return BlocBuilder(
            bloc: _mainBloc,
            builder: (_, AuthenticationState state) {
              return state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _buildNavigator(state.isLoggedIn);
            });
      },
    );
  }

  ///Building Navigation if the user is logged in then authenticated routes will
  ///be used other wise auth pending routes @isAuthenticated is the boolean which
  ///is the status of the user login
  Navigator _buildNavigator(bool isAuthenticated) {
    // different route tree and different default route depending on auth state
    final routes = isAuthenticated ? authenticatedRoutes : authPendingRoutes;
    return Navigator(
      key: new ValueKey(isAuthenticated),
      onGenerateRoute: (RouteSettings settings) {
        final name = settings.name;
        return new MaterialPageRoute(
          builder: routes[name],
          settings: settings,
        );
      },
      onUnknownRoute: (RouteSettings settings) {
        throw Exception('unknown route');
      },
    );
  }
}
