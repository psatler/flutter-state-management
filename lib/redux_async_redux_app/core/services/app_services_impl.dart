import 'package:flutter_state_management/redux_async_redux_app/core/services/http/http_service.dart';

class AppServicesImpl {
  // https://github.com/marcglasberg/async_redux/issues/107#issuecomment-863830998
  final IHttpService httpService;

  AppServicesImpl({
    required this.httpService,
  });
}
