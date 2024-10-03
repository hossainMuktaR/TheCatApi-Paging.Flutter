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
      final url = Uri.parse(CatApiRoutes.getCats)
      .replace(queryParameters: {
        'has_breeds': 'true',
        'page': page.toString(),
        'limit': limit.toString(),
      });

      final response = await client.get(
        url,
        headers: {
          'x-api-key':  Constant.apikey,
        });
      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json
            .map((item) => Cat.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("error on response");
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Faild to Load Cat");
    }
  }
}
