import 'package:apnabusinessdemo/backend/models/itemModel.dart';
import 'package:apnabusinessdemo/backend/repositories/itemRepository.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final ItemRepository _repository = ItemRepository();
  final Rxn<ItemModel> _subject = Rxn<ItemModel>();

  Rxn<ItemModel> get subject => _subject;

  Future<void> getItemDetail(String? id) async {
    ItemModel response = await _repository.getItemDetail(id: id);
    _subject.value = response;
  }
}
