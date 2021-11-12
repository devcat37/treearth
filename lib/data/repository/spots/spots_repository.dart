// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:treearth/data/api/api_client.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';

class SpotsRepository {
  static const SPOTS_ENDPOINT = Settings.backendUrl + '/spots';
  static const GET_IN_RADIUS_ENDPOINT = SPOTS_ENDPOINT + '/getInRadius';

  ApiClient get apiClient => service<ApiClient>();
  Settings get settings => service<Settings>();

  Future<ListLoadResult<Spot>> loadSpotsInRadius(double latitude, double longtitude) async {
    try {
      // Тело запроса.
      final Map<String, dynamic> params = {
        Settings.latitudeKey: latitude,
        Settings.longtitudeKey: longtitude,
        Settings.radiusKey: Settings.defaultSearchSpotRadius,
      };

      final Map<String, dynamic> headers = {
        'Authorization': 'Bearer ${settings.accessToken}',
      };

      final Map<String, dynamic> result = await apiClient
          .get(url: GET_IN_RADIUS_ENDPOINT, params: params, headers: headers)
          .then((value) => value.data);

      final List<dynamic> data = result['data'];
      final List<Map<String, dynamic>> mappedData = data.map((e) => e as Map<String, dynamic>).toList();

      return ListLoadResult(data: mappedData.map((e) => Spot.fromJson(e)).toList());
    } catch (e, s) {
      print(e);
      print(s);
      return ListLoadResult(exception: e);
    }
  }
}
