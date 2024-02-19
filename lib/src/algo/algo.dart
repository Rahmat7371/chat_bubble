import './date_chip_text.dart';

abstract class Algo {
  Algo._();
  static String dateChipText(final DateTime date) {
    final dateChipText = DateChipText(date);
    return dateChipText.getText();
  }
}
