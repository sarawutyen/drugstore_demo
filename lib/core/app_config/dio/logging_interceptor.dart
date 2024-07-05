import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  final StreamController<RequestOptions> _requestStream =
      StreamController<RequestOptions>.broadcast();

  Stream<RequestOptions> get onRequestStream => _requestStream.stream;

  final StreamController<Response<dynamic>> _responseStream =
      StreamController<Response<dynamic>>.broadcast();

  Stream<Response<dynamic>> get onResponseStream => _responseStream.stream;

  final StreamController<DioException> _errorStream =
      StreamController<DioException>.broadcast();

  Stream<DioException> get onErrorStream => _errorStream.stream;

  DioException? _currentDioError;

  DioException? get getCurrentDioError => _currentDioError;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _requestStream.add(options);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logData(
        '''RESPONSE[${response.statusCode}] => PATH: ${response.realUri.path}''');
    _responseStream.add(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logData(
        '''ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}\n=>> ${err.response?.data}''');
    _errorStream.add(err);
    return super.onError(err, handler);
  }

  void logData(String data) {
    log(data);
  }
}
