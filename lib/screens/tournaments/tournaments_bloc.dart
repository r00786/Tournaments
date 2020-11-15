import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
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
  TournamentsState get initialState => (TournamentsState.initial());

  @override
  Stream<TournamentsState> mapEventToState(
      TournamentsState currentState, TournamentsEvent event) async* {
    ///If the event is to fetch tournaments list
    if (event is TournamentListEvent) {
      ///getting the response from the network
      BaseModel<TournamentsResponse> baseResponse =
          await _dataSource.getTournamentsList(currentState.cursor);
      if (baseResponse.getException != null) {
        yield TournamentsState.itemsFetchFailure(
            isError: true, error: baseResponse.getException);
      } else {
        TournamentsResponse response = baseResponse.data;

        ///returning the fetched response to bloc builder
        yield TournamentsState.itemsFetchSuccess(
            list: currentState.items +
                BuiltList<Tournaments>.of(response.data.tournaments),
            cursor: response.data.cursor,
            isLastPage: response.data.isLastBatch);
      }
    }
  }

  ///Method will be called when we need to fetch the tournaments list
  getTournaments() {
    dispatch(TournamentListEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  TournamentsBloc(this._dataSource);
}
