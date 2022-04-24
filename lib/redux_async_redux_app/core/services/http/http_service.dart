import '../../../features/tasks/tasks.dart';

abstract class IHttpService {
  Future<List<TasksModel>> get(String url);

  Future<T> post<T>(String url, {required Map data});
}
