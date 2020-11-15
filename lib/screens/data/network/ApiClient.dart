import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tournaments/screens/data/models/response/TournamentsResponse.dart';

part 'ApiClient.g.dart';

///Api Client class to declare all the network calls
@RestApi(baseUrl: "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  ///api to fetch tournaments @limit is the limit of items to fetch after the
  ///@cursor and @status is the type of tournaments you want to fetch
  @GET("/tournaments_list_v2")
  Future<TournamentsResponse> getTournaments(
      @Query("limit") int limit, @Query("status") String status,
      {@Query("cursor") String cursor});
}
