import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hitapi/app/modules/articles/models/ArticleModels.dart';
import 'package:http/http.dart' as http;

class ArticleController extends GetxController {
  RxList<dynamic> results = RxList<dynamic>([]);

  void getData() async {
    var uri = Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-01-06&sortBy=publishedAt&apiKey=7981d6f5e59849e5baa49b5f92003006');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['articles'] != null) {
        results.value = data['articles'] as List<dynamic>;
        // debugPrint(results.value.toString());
      } else {
        debugPrint('Data "articles" tidak ditemukan dalam respons API.');
      }
    } else {
      debugPrint('Request failed with status: ${response.statusCode}');
    }
  }
}
