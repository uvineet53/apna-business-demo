import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apnabusinessdemo/backend/controllers/itemController.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Detail"),
      ),
      body: GetX<ItemController>(
        init: ItemController(),
        builder: (ItemController controller) {
          controller.getItemDetail(id);
          if (controller.subject.value == null) {
            return CircularProgressIndicator();
          } else {
            return Text(controller.subject.value!.title);
          }
        },
      ),
    );
  }
}
