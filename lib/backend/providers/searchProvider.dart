import 'package:apnabusinessdemo/backend/models/searchModel.dart';
import 'package:dio/dio.dart';

class SearchApiProvider {
  final Dio _dio = Dio();

  Future<SearchModel> getResults({String? query}) async {
    String _endpoint = "https://hn.algolia.com/api/v1/search?query=$query";
    Response response = await _dio.get(_endpoint);
    return SearchModel.fromJson(response.data);
  }
}
