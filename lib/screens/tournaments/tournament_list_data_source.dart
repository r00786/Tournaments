import 'package:tournaments/screens/data/models/response/BaseModel.dart';
import 'package:tournaments/screens/data/models/response/ServerError.dart';
import 'package:tournaments/screens/data/models/response/TournamentsResponse.dart';
import 'package:tournaments/screens/data/network/ApiClient.dart';
///Tournaments Data Source
class TournamentsListDataSource {
  ///Object to fetch data from network
  final ApiClient _apiClient;

  ///Method to get tournaments list @cursor is the object to fetch next tournaments
  Future<BaseModel<TournamentsResponse>> getTournamentsList(
      String cursor) async {
    try {
      return BaseModel<TournamentsResponse>()
        ..data = await _apiClient.getTournaments(10, "all", cursor: cursor);
    } catch (error) {
      return BaseModel()
        ..setException(ServerError.withError(error: error));
    }
  }

  TournamentsListDataSource(this._apiClient);
}
