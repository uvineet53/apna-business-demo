import 'package:apnabusinessdemo/backend/controllers/searchController.dart';
import 'package:apnabusinessdemo/frontend/screens/itemDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget searchItemWidget(SearchController controller, int index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: GestureDetector(
      onTap: () async {
        Get.to(ItemDetail(id: controller.subject.value?.hits[index].objectId));
      },
      child: VStack(
        [
          Text(controller.subject.value?.hits[index].title ?? "",
              style: GoogleFonts.poppins(fontSize: 18, color: Vx.black)),
          SizedBox(
            height: 10,
          ),
          HStack(
            [
              Text(
                  "credits: ${controller.subject.value?.hits[index].author ?? ""}",
                  style: GoogleFonts.poppins(fontSize: 12, color: Vx.gray500)),
              Text(
                  timeago.format(controller.subject.value?.hits[index].createdAt
                      as DateTime),
                  style: GoogleFonts.poppins(fontSize: 12, color: Vx.black))
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ).box.width(double.infinity).make()
        ],
      )
          .box
          .width(double.infinity)
          .gray100
          .border(color: Colors.black12)
          .p16
          .rounded
          .make(),
    ),
  );
}
