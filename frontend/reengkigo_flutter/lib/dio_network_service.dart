import 'package:dio/dio.dart';

class DioNetworkService {
  static final Dio _dio = Dio();

  static Future<String> httpGetTest() async {
    try {
      final response = await _dio.get('https://httpbin.org/get');
      return response.data.toString();
    } catch (e) {
      throw Exception('DIO GET Error: $e');
    }
  }

  static Future<String> httpGet(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data.toString();
    } catch (e) {
      throw Exception('DIO GET Error: $e');
    }
  }

  static Future<String> httpPost(String url, String jsonData) async {
    try {
      final response = await _dio.post(
        url,
        data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data.toString();
    } catch (e) {
      throw Exception('DIO POST Error: $e');
    }
  }

  static Future<String> login(String url, String account, String password) async {
    try {
      final loginData = {
        'account': account,
        'password': password,
      };
      
      final response = await _dio.post(
        url,
        data: loginData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data.toString();
    } catch (e) {
      throw Exception('DIO Login Error: $e');
    }
  }
}

