import 'dart:convert';

import 'package:flutter_scale/models/NewsDetailModel.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/utils/constant.dart';
import 'package:http/http.dart' as http;

class CallApi {
  // URL API ໃຫ້ສັ້ນລົງ

  //Header for API
  //Convert to json
  _setHeader() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  //function for login
  loginAPI(data) async {
    return await http.post(Uri.parse(baseURLAPI + 'login'),
        body: jsonEncode(data), headers: _setHeader());
  }

  //ຟັງຊັນອ່ານຂ່າວທັງໝົດ
  Future<List<NewsModel>?> getAllNes() async {
    final response = await http.get(
      Uri.parse(baseURLAPI + 'news'),
      headers: _setHeader(),
    );
    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<NewsModel>?> getLastNews() async {
    final response = await http.get(
      Uri.parse(baseURLAPI + 'lastnews'),
      headers: _setHeader(),
    );
    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<NewsDetailModel?> getNewsDetailModel(id) async {
    final response = await http.get(
      Uri.parse(baseURLAPI + 'news/' + id),
      headers: _setHeader(),
    );
    if (response.body != null) {
      return newsDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
