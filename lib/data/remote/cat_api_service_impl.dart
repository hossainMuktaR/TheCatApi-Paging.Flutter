import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thecatapi_flutter/common/cat_api_routes.dart';
import 'package:thecatapi_flutter/common/constant.dart';
import 'package:thecatapi_flutter/data/remote/cat_api_service.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';

class CatApiServiceImpl implements CatApiService {
  final http.Client client;

  CatApiServiceImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<Cat>> getCats(int page, int limit) async {
    try {
      final url = Uri.parse(CatApiRoutes.getCats).replace(queryParameters: {
        'has_breeds': 'true',
        'page': page.toString(),
        'limit': limit.toString(),
      });

      debugPrint('request url: $url');

      final response = await client.get(url, headers: {
        'x-api-key': Constant.apikey,
      });
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          debugPrint('${response.body.toString()}');
          final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
          return json
              .map((item) => Cat.fromJson(item as Map<String, dynamic>))
              .toList();
        } else {
          // Handle the case where the body is empty
          debugPrint('Response body is empty');
          throw Exception('Response body is empty');
        }
      } else {
        throw Exception('Error: Status code ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load cats');
    }
  }
}
