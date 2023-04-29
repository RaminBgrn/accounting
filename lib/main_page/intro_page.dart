import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goliza/common/colors.dart';
import 'package:goliza/pages/home/view/home.dart';
import 'package:goliza/pages/warehouse/view/warehouse.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _index = 0;
  int _currentPage = 0;
  late PageController _homePageViewController;
  @override
  void initState() {
    _homePageViewController = PageController(initialPage: _index);
    _homePageViewController.addListener(() {
      setState(() {
        _currentPage = _homePageViewController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey[800],
      body: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: myGrey[600],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      maxRadius: 30,
                      minRadius: 20,
                      child: Image.asset(
                        'images/user_avatar.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        menuItem('خـانـه', "svgs/home.svg", () {
                          _index = 0;
                          _homePageViewController.jumpToPage(_index);
                        }, 0 == _currentPage),
                        menuItem('انبـار', "svgs/ambar.svg", () {
                          _index = 1;
                          _homePageViewController.jumpToPage(_index);
                        }, 1 == _currentPage),
                        menuItem('فـروش', "svgs/sell.svg", () {
                          _index = 2;
                          _homePageViewController.jumpToPage(_index);
                        }, 2 == _currentPage),
                      ],
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: SizedBox(
              child: PageView(
                controller: _homePageViewController,
                children: [
                  const Home(),
                  const Warehouse(),
                  Container(
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuItem(
      String title, String icon, VoidCallback onClick, bool isSelected) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          padding: const EdgeInsets.all(6),
          decoration: isSelected
              ? BoxDecoration(
                  color: myGreen[900]!.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: myGreen[900]!),
                )
              : null,
          child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 20,
                  color: myGrey[300],
                ),
                Text(
                  title,
                  style:
                      GoogleFonts.vazirmatn(fontSize: 14, color: myGrey[300]),
                )
              ]),
        ),
      ),
    );
  }
}
