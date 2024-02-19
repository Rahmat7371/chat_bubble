import 'package:chat_ui_test/src/algo/algo.dart';
import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  final DateTime date;
  final Color? color;
  const DateChip({
    Key? key,
    required this.date,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 7,
          bottom: 7,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              Algo.dateChipText(date),
              style: TextStyle(
                color: theme.brightness == Brightness.light
                    ? Colors.black54
                    : Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
