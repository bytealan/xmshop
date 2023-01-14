import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = "https://xiaomi.itying.com/";

  static Dio dio = Dio();

  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
  }

  Future get(apiUrl) async {
    try {
      return await dio.get(apiUrl);
    } catch (e) {
      return null;
    }
  }

  static replaceUri(picUrl) {
    return (domain + picUrl).replaceAll("\\", "/");
  }
}
