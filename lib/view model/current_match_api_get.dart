import 'dart:convert';
import 'dart:developer' as developer;

import 'package:cricketodds/view%20model/api_key/api_key.dart';
import 'package:cricketodds/models/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LiveScore {
  Future<Model?> fetchData() async {
    try {
      final response = await http.get(Uri.parse(ApiKey));
      if (response.statusCode == 200) {
        developer.log("Data fatch succesfull");
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'success') {
          return Model.fromJson(jsonData);
        }
        // return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        Text("Failed to Load\n Check your Internet or try after some time");
        return null;
      }
    } catch (e) {
      developer.log(e.toString());
      return null;
    }
    return null;
  }
}
