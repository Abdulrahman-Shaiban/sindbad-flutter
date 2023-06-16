
import 'package:intl/intl.dart';

String formatDateTimeToYmd({required DateTime? date}) {
  return date != null ?DateFormat.yMd().format(date): '';
}

String formatPrices({required num? number}) {
  return NumberFormat.decimalPattern('en_us').format(number);
}
