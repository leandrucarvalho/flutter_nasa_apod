import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/apod_image_model.dart';
import '../models/apod_pagination_model.dart';

class ApodService {
  final String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final _apiKey = dotenv.env['API_KEY'];

  final Dio _dio = Dio();

  Future<List<ApodImageModel>> fetchApods(
      ApodPaginationModel pagination) async {
    final Map<String, dynamic> queryParams = {
      'api_key': _apiKey,
    };

    if (pagination.startDate != null) {
      queryParams['start_date'] = pagination.startDate;
    }

    if (pagination.endDate != null) {
      queryParams['end_date'] = pagination.endDate;
    }

    if (pagination.count != null) {
      queryParams['count'] = pagination.count.toString();
    }

    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => ApodImageModel.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar as imagens');
      }
    } catch (error) {
      throw Exception('Erro de conexão: $error');
    }
  }
}
