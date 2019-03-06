import 'package:dio/dio.dart';

Future getHttp(String url) async {
  try {
    Response response = await Dio().get(url);
    return response;
  } catch (e) {
    print(e);
  }
}

Future postHttp(String url, dynamic params) async {
  try {
    Response response = await Dio().post(url, data: params);
    return response;
  } catch (e) {
    print(e);
  }
}

