import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:tournaments/screens/data/models/response/TournamentsResponse.dart';

part 'tournaments_state.g.dart';

abstract class TournamentsState
    implements Built<TournamentsState, TournamentsStateBuilder> {
  BuiltList<Tournaments> get items;

  @nullable
  bool get isLastPage;

  @nullable
  String get cursor;

  TournamentsState._();

  factory TournamentsState([updates(TournamentsStateBuilder b)]) =
      _$TournamentsState;

  factory TournamentsState.itemsFetchSuccess(
      BuiltList<Tournaments> list, String cursor, bool isLastPage) {
    return TournamentsState((t) => t
      ..items.replace(list)
      ..isLastPage = isLastPage
      ..cursor = cursor);
  }
}
