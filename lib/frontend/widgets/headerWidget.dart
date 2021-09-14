import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget header() {
  return VStack(
    [
      HStack(
        [
          Text(
            "Hacker",
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " News",
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Vx.blue600,
            ),
          ),
        ],
      ),
    ],
  );
}
