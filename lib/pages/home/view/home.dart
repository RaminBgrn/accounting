import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goliza/common/colors.dart';
import 'package:goliza/pages/home/controller/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey[800],
      body: Column(
        children: [
          Row(children: [
            Container(
              margin: const EdgeInsets.all(18),
              width: MediaQuery.of(context).size.width * 0.4,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: myGrey[900]!),
                color: myGrey[600]!.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: myPurple[900]!.withOpacity(0.2)),
                      child: AnalogClock(
                        digitalClockColor: myGrey[200]!,
                        hourHandColor: myGrey[200]!,
                        minuteHandColor: myGrey[400]!,
                        numberColor: myGrey[200]!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'تـاریخ امـروز',
                            style: GoogleFonts.vazirmatn(
                                fontSize: 20,
                                color: myGrey[400],
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        GetBuilder<HomeController>(builder: (clr) {
                          return Text(
                            clr.format(),
                            style: GoogleFonts.vazirmatn(
                                fontSize: 16, color: myGrey[400]!),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
          Text(
            "بـزودی...",
            textDirection: TextDirection.rtl,
            style: GoogleFonts.vazirmatn(
              fontSize: 90,
              color: myGrey[400],
            ),
          )
        ],
      ),
    );
  }
}
