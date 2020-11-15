import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tournaments/screens/data/models/response/BaseModel.dart';
import 'package:tournaments/screens/data/models/response/TournamentsResponse.dart';
import 'package:tournaments/screens/tournaments/tournament_list_data_source.dart';
import 'package:tournaments/screens/tournaments/tournaments_event.dart';
import 'package:tournaments/screens/tournaments/tournaments_state.dart';

///Tournaments Bloc
class TournamentsBloc extends Bloc<TournamentsEvent, TournamentsState> {
  ///Object of the data source
  final TournamentsListDataSource _dataSource;
///Initial state when no data is present
  @override
  TournamentsState get initialState => (TournamentsState());

  @override
  Stream<TournamentsState> mapEventToState(
      TournamentsState currentState, TournamentsEvent event) async* {
    if (event is TournamentListEvent) {
      BaseModel<TournamentsResponse> baseResponse =
          await _dataSource.getTournamentsList(currentState.cursor);
      TournamentsResponse response = baseResponse.data;
      yield TournamentsState.itemsFetchSuccess(
          currentState.items +
              BuiltList<Tournaments>.of(response.data.tournaments),
          response.data.cursor,
          response.data.isLastBatch);
    }
  }

  getTournaments() {
    dispatch(TournamentListEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _tournamentsListPbs.close();
  }

  TournamentsBloc(this._dataSource);
}
