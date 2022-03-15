import 'package:dio/dio.dart';
import 'package:magicale/constants.dart';

// class ttaht contains the REST APIS
class Repository {
  var dio = Dio();

  Future validateEmail(Object data) async {
    Response response =
        await dio.post(api+'verify', data: data);

    return response.data;
  }
}
