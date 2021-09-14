import 'package:apnabusinessdemo/backend/controllers/itemController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget commentWidget(ItemController controller, int index) {
  return VStack(
    [
      "Author".text.make().px8(),
      Text(
        controller.subject.value!.children![index].author,
        style: GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.bold),
      ).px8(),
      Html(data: controller.subject.value!.children![index].text),
    ],
  ).box.gray200.rounded.p12.make();
}
