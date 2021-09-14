import 'package:apnabusinessdemo/backend/models/itemModel.dart';
import 'package:apnabusinessdemo/backend/providers/itemProvider.dart';

class ItemRepository {
  ItemApiProvider _apiProvider = ItemApiProvider();

  Future<ItemModel> getItemDetail({String? id}) {
    return _apiProvider.getItemDetail(id: id);
  }
}
