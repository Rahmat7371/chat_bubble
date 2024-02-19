import 'package:chat_ui_test/utils.dart';
import 'package:flutter/material.dart';

const double bubbleRadiuss = 16;

class BubbleNormal extends StatelessWidget {
  final double bubbleRadius;
  final bool isSender;
  final Color color;
  final String text;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle? textStyle;
  final BoxConstraints? constraints;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  const BubbleNormal({
    Key? key,
    required this.text,
    this.constraints,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    this.bubbleRadius = bubbleRadiuss,
    this.isSender = true,
    this.color = Colors.white70,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.textStyle,
  }) : super(key: key);

  //chat bubble builder method
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color.fromARGB(255, 158, 208, 139),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color.fromARGB(255, 87, 176, 172),
      );
    }

    return Row(
      children: <Widget>[
        isSender
            ? const Expanded(
                child: SizedBox(
                  width: 5,
                ),
              )
            : leading ?? Container(),
        Container(
          color: Colors.transparent,
          constraints: constraints ??
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
          margin: margin,
          padding: padding,
          child: GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: theme.brightness == Brightness.light
                        ? Colors.grey.withOpacity(0.1)
                        : Colors.transparent,
                    width: 0.5),
                color: isSender
                    ? (theme.brightness == Brightness.light
                        ? Utils.bubbleSenderLightColor
                        : Utils.bubbleSenderDarkColor)
                    : (theme.brightness == Brightness.dark
                        ? Utils.bubbleResieverDarkColor
                        : Utils.bubbleResieverLightColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(bubbleRadius),
                  topRight: Radius.circular(bubbleRadius),
                  bottomLeft: Radius.circular(tail
                      ? isSender
                          ? bubbleRadius
                          : 2.5
                      : bubbleRadiuss),
                  bottomRight: Radius.circular(tail
                      ? isSender
                          ? 2.5
                          : bubbleRadius
                      : bubbleRadiuss),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: stateTick
                        ? const EdgeInsets.fromLTRB(12, 6, 28, 6)
                        : const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                    child: SelectableText(
                      text,
                      style: textStyle ??
                          (TextStyle(
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  stateIcon != null && stateTick
                      ? Positioned(
                          bottom: 4,
                          right: 6,
                          child: stateIcon,
                        )
                      : const SizedBox(
                          width: 1,
                        ),
                ],
              ),
            ),
          ),
        ),
        if (isSender && trailing != null) const SizedBox.shrink(),
      ],
    );
  }
}
