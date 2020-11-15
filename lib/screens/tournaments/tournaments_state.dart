import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:tournaments/screens/data/models/response/TournamentsResponse.dart';

part 'tournaments_state.g.dart';

///Using Built library to add list items with ease
abstract class TournamentsState
    implements Built<TournamentsState, TournamentsStateBuilder> {
  ///Tournaments list
  BuiltList<Tournaments> get items;

  /// bool indicating last item or not
  @nullable
  bool get isLastPage;

  ///cursor to get next items list
  @nullable
  String get cursor;

  @nullable
  String get error;

  bool get isError;

  TournamentsState._();

  factory TournamentsState([updates(TournamentsStateBuilder b)]) =
      _$TournamentsState;

  ///getting items to show in the list
  factory TournamentsState.itemsFetchSuccess({
    BuiltList<Tournaments> list,
    String cursor,
    bool isLastPage,
  }) {
    return TournamentsState((t) => t
      ..items.replace(list)
      ..isLastPage = isLastPage
      ..cursor = cursor
      ..isError = false);
  }

  factory TournamentsState.itemsFetchFailure({bool isError, String error}) {
    return TournamentsState((t) => t
      .._isError = isError
      ..error = error);
  }

  factory TournamentsState.initial() {
    return TournamentsState((t) => t..isError = false);
  }
}
