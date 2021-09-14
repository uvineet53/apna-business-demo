import 'package:apnabusinessdemo/backend/models/searchModel.dart';
import 'package:apnabusinessdemo/backend/repositories/searchRepository.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final SearchRepository _repository = SearchRepository();
  final Rxn<SearchModel> _subject = Rxn<SearchModel>();
  Rxn<SearchModel> get subject => _subject;

  void getResults(String? query) async {
    SearchModel response = await _repository.getResults(query: query);
    _subject.value = response;
  }
}
