import 'package:apnabusinessdemo/backend/controllers/itemController.dart';
import 'package:apnabusinessdemo/backend/controllers/searchController.dart';
import 'package:apnabusinessdemo/frontend/screens/itemDetail.dart';
import 'package:apnabusinessdemo/frontend/widgets/headerWidget.dart';
import 'package:apnabusinessdemo/frontend/widgets/searchItemWidget.dart';
import 'package:apnabusinessdemo/frontend/widgets/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final searchFormkey = GlobalKey<FormState>();
  final searchtextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GetX<SearchController>(
              init: SearchController(),
              builder: (SearchController controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      header(),
                      SizedBox(
                        height: 10,
                      ),
                      searchWidget(
                          controller, searchFormkey, searchtextController),
                      SizedBox(
                        height: 10,
                      ),
                      controller.subject.value != null
                          ? Text(
                              "${controller.subject.value!.hits.length} Search Results:",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      controller.subject.value != null
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.subject.value?.hits.length,
                                itemBuilder: (context, index) {
                                  return searchItemWidget(controller, index);
                                },
                              ),
                            )
                          : Container()
                    ],
                  ),
                );
              }),
        ));
  }
}
