// import 'package:flutter/material.dart';

// class BubbleSpecialTwo extends StatelessWidget {
//   final bool isSender;
//   final String text;
//   final bool tail;
//   final Color color;
//   final bool sent;
//   final bool delivered;
//   final bool seen;
//   final TextStyle textStyle;
//   final BoxConstraints? constraints;

//   const BubbleSpecialTwo({
//     Key? key,
//     this.isSender = true,
//     this.constraints,
//     required this.text,
//     this.color = Colors.white70,
//     this.tail = true,
//     this.sent = false,
//     this.delivered = false,
//     this.seen = false,
//     this.textStyle = const TextStyle(
//       color: Colors.black87,
//       fontSize: 16,
//     ),
//   }) : super(key: key);

//   ///chat bubble builder method
//   @override
//   Widget build(BuildContext context) {
//     bool stateTick = false;
//     Icon? stateIcon;
//     if (sent) {
//       stateTick = true;
//       stateIcon = const Icon(
//         Icons.done,
//         size: 18,
//         color: Color(0xFF97AD8E),
//       );
//     }
//     if (delivered) {
//       stateTick = true;
//       stateIcon = const Icon(
//         Icons.done_all,
//         size: 18,
//         color: Color(0xFF97AD8E),
//       );
//     }
//     if (seen) {
//       stateTick = true;
//       stateIcon = const Icon(
//         Icons.done_all,
//         size: 18,
//         color: Color(0xFF92DEDA),
//       );
//     }

//     return Align(
//       alignment: isSender ? Alignment.topRight : Alignment.topLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//         child: CustomPaint(
//           painter: SpecialChatBubbleTwo(
//               color: color,
//               alignment: isSender ? Alignment.topRight : Alignment.topLeft,
//               tail: tail),
//           child: Container(
//             constraints: constraints ??
//                 BoxConstraints(
//                   maxWidth: MediaQuery.of(context).size.width * .8,
//                 ),
//             margin: isSender
//                 ? stateTick
//                     ? const EdgeInsets.fromLTRB(7, 7, 14, 7)
//                     : const EdgeInsets.fromLTRB(7, 7, 17, 7)
//                 : const EdgeInsets.fromLTRB(17, 7, 7, 7),
//             child: Stack(
//               children: <Widget>[
//                 Padding(
//                   padding: stateTick
//                       ? const EdgeInsets.only(right: 20)
//                       : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//                   child: Text(
//                     text,
//                     style: textStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 stateIcon != null && stateTick
//                     ? Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: stateIcon,
//                       )
//                     : const SizedBox(
//                         width: 1,
//                       ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SpecialChatBubbleTwo extends CustomPainter {
//   final Color color;
//   final Alignment alignment;
//   final bool tail;

//   SpecialChatBubbleTwo({
//     required this.color,
//     required this.alignment,
//     required this.tail,
//   });

//   final double _radius = 10.0;
//   final double _x = 10.0;

//   @override
//   void paint(Canvas canvas, Size size) {
//     if (alignment == Alignment.topRight) {
//       if (tail) {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               0,
//               0,
//               size.width - 8,
//               size.height,
//               bottomLeft: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//               bottomRight: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//         var path = Path();
//         path.moveTo(size.width - _x, 4);
//         path.lineTo(size.width - _x, size.height - 5);
//         path.lineTo(size.width, size.height);
//         canvas.clipPath(path);
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               size.width - _x,
//               0.0,
//               size.width,
//               size.height,
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       } else {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               0,
//               0,
//               size.width - 8,
//               size.height,
//               bottomLeft: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//               bottomRight: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       }
//     } else {
//       if (tail) {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               8,
//               0,
//               size.width,
//               size.height,
//               bottomRight: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//               bottomLeft: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//         var path = Path();
//         path.moveTo(_x, 4);
//         path.lineTo(0, size.height);
//         path.lineTo(_x, size.height - 5);
//         canvas.clipPath(path);
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               0,
//               0.0,
//               _x,
//               size.height,
//               topRight: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       } else {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               8,
//               0,
//               size.width,
//               size.height,
//               bottomRight: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//               bottomLeft: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
