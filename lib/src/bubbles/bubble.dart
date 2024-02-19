// library flutter_chat_bubble;

// import 'package:chat_ui_test/src/bubbles/bubble_special_four.dart';
// import 'package:flutter/material.dart';

// class ChatBubble extends StatelessWidget {
//   final CustomClipper? clipper;
//   final Widget? child;
//   final EdgeInsetsGeometry? margin;
//   final double? elevation;
//   final Color? backGroundColor;
//   final Color? shadowColor;
//   final Alignment? alignment;
//   final EdgeInsetsGeometry? padding;
//   final bool? isSender;

//   const ChatBubble({
//     super.key,
//     this.clipper,
//     this.child,
//     this.margin,
//     this.elevation,
//     this.backGroundColor,
//     this.shadowColor,
//     this.alignment,
//     this.padding,
//     this.isSender,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: alignment ?? Alignment.topLeft,
//       margin: margin ?? const EdgeInsets.all(0),
//       child: PhysicalShape(
//         clipper: clipper as CustomClipper<Path>,
//         elevation: elevation ?? 2,
//         color: backGroundColor ?? Colors.blue,
//         shadowColor: shadowColor ?? Colors.grey.shade200,
//         child: Padding(
//           padding: padding ?? setPadding(),
//           child: child ?? Container(),
//         ),
//       ),
//     );
//   }

//   /// Determines the amount of padding to use in the `Container`, based on the
//   /// selected `clipper` type.
//   EdgeInsets setPadding() {
//     if (clipper is BubbleSpecialFour) {
//       if ((clipper as BubbleSpecialFour).isSender == true) {
//         return const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 25);
//       } else {
//         return const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 10);
//       }
//     }

//     return const EdgeInsets.all(10);
//   }
// }
