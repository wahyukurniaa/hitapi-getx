import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxList<dynamic> results = RxList<dynamic>([]);

  void getUser() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = response.body;
      // debugPrint('data: ${response.body}');

      results.value = jsonDecode(data) as List<dynamic>;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}');
    }
  }
}
