import 'package:apnabusinessdemo/backend/controllers/searchController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Form searchWidget(
    SearchController controller,
    GlobalKey<FormState> searchFormkey,
    TextEditingController searchtextController) {
  return Form(
    key: searchFormkey,
    child: TextFormField(
      controller: searchtextController,
      style: TextStyle(fontSize: 18),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Search Field can't be empty";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "search anything",
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(color: Colors.grey[600]),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Vx.black,
              size: 22,
            ),
            onPressed: () async {
              if (searchFormkey.currentState!.validate()) {
                await controller.getResults(searchtextController.text);
              }
            },
          )),
    ).py4().box.gray200.px12.rounded.make(),
  );
}
