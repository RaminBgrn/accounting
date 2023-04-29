import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goliza/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Warehouse extends StatelessWidget {
  const Warehouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey[800],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'دسـته بنـدی‌ها',
                  style: GoogleFonts.vazirmatn(
                    fontSize: 18,
                    color: myGrey[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: myGrey[900],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: const ScrollBehavior().copyWith(dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch
                        }),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 50,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              height: 30,
                              width: 50,
                              color: Colors.green,
                            );
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 100,
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: myGreen[900]!.withOpacity(0.3),
                          border: Border.all(width: 1, color: myGreen[600]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'دسـته جـدید',
                            style: GoogleFonts.vazirmatn(
                              fontSize: 14,
                              color: myGrey[300],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      myGrey[800]!,
                      myGrey[700]!,
                      myGrey[500]!,
                      myGrey[700]!,
                      myGrey[800]!,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
