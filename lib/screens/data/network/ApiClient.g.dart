// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl =
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api';

  @override
  Future<TournamentsResponse> getTournaments(int limit, String status,
      {String cursor}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'limit': limit,
      'status': status,
    };
    if (cursor != null) {
      queryParameters["cursor"] = cursor;
    }
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/tournaments_list_v2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TournamentsResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
