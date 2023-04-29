import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeController extends GetxController {
  final Jalali _jalaliToDay = Jalali.now();
  String format() {
    final format = _jalaliToDay.formatter;
    return "${format.wN}  ${format.d} ${format.mN}  ${format.yyyy}";
  }
}
