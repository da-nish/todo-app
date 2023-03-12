import 'package:intl/intl.dart';

extension TimeExtensions on DateTime {
  String dateFormat() {
    final DateFormat formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(this);
  }

  String dateFormatDDMM() {
    final DateFormat formatter = DateFormat('dd MMM');
    return formatter.format(this);
  }
}
