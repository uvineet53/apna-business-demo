import 'package:apnabusinessdemo/backend/models/itemModel.dart';
import 'package:dio/dio.dart';

class ItemApiProvider {
  final Dio _dio = Dio();

  Future<ItemModel> getItemDetail({String? id}) async {
    String _endpoint = "https://hn.algolia.com/api/v1/items/$id";
    Response response = await _dio.get(_endpoint);
    return ItemModel.fromJson(response.data);
  }
}
