import 'package:intl/intl.dart';

///initial formatter to find the date txt
final DateFormat _formatter = DateFormat('yyyy-MM-dd');

class DateChipText {
  final DateTime date;

  DateChipText(this.date);

  String getText() {
    final now = DateTime.now();
    if (_formatter.format(now) == _formatter.format(date)) {
      return 'Today';
    } else if (_formatter.format(DateTime(now.year, now.month, now.day - 1)) ==
        _formatter.format(date)) {
      return 'Yesterday';
    } else {
      return '${DateFormat('d').format(date)} ${DateFormat('MMMM').format(date)} ${DateFormat('y').format(date)}';
    }
  }
}
