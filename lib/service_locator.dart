
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service/api_services.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/v2/',
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );
}