import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

import '../../../core/constants/constants.dart';
import 'http_service.dart';

class DioService implements IHttpService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: HttpConstants.urlPlaceHolder,
    ),
  );

  @override
  Future<List<TasksModel>> get(String url) async {
    final response = await _dio.get(url);

    final parsed = response.data as List;

    List<TasksModel> tasksList =
        parsed.map((item) => TasksModel.fromMap(item)).toList();

    return tasksList;
  }

  @override
  Future<T> post<T>(String url, {required Map data}) async {
    final response = await _dio.post(url, data: data);

    return jsonDecode(response.data);
  }
}
