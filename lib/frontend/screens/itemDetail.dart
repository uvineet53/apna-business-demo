import 'package:apnabusinessdemo/frontend/widgets/commentWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:apnabusinessdemo/backend/controllers/itemController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago/timeago.dart' as timeago;

class ItemDetail extends StatefulWidget {
  const ItemDetail({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String? id;

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  final itemController = Get.put(ItemController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<ItemController>(
          init: ItemController(),
          builder: (ItemController controller) {
            controller.getItemDetail(widget.id);
            if (controller.subject.value == null) {
              return Center(
                  child: SpinKitDoubleBounce(
                color: Vx.blue600,
              ));
            } else {
              return Column(
                children: [
                  HStack([
                    Expanded(
                      child: Text(
                        '"${controller.subject.value!.title}"',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    VStack(
                      [
                        Text(
                          controller.subject.value!.points.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Vx.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ).box.blue600.p12.roundedFull.make(),
                        Text(
                          "Points",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Vx.blue600,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                    )
                  ]).box.width(double.infinity).p16.make(),
                  HStack(
                    [
                      Text("Author : ${controller.subject.value?.author ?? ""}",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Vx.gray500)),
                      Text(
                          timeago.format(
                              controller.subject.value?.createdAt as DateTime),
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Vx.black))
                    ],
                    alignment: MainAxisAlignment.spaceBetween,
                  ).box.width(double.infinity).px20.make(),
                  SizedBox(height: 5),
                  Text("Comments : ${controller.subject.value!.children!.length}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Vx.gray800))
                      .objectCenterLeft()
                      .px20(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.subject.value!.children!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: commentWidget(controller, index),
                        );
                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
