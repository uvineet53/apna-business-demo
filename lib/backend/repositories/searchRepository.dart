import 'package:apnabusinessdemo/backend/models/searchModel.dart';
import 'package:apnabusinessdemo/backend/providers/searchProvider.dart';

class SearchRepository {
  SearchApiProvider _apiProvider = SearchApiProvider();

  Future<SearchModel> getResults({String? query}) {
    return _apiProvider.getResults(query: query);
  }
}
