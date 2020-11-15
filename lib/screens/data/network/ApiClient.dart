import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tournaments/screens/data/models/response/TournamentsResponse.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/tournaments_list_v2")
  Future<TournamentsResponse> getTournaments(
      @Query("limit") int limit, @Query("status") String status,
      {@Query("cursor") String cursor});
}
