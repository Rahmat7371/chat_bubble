// import 'package:flutter/material.dart';

// class BubbleSpecialFour extends CustomClipper<Path> {
//   final double radius;
//   final double nipHeight;
//   final double nipWidth;
//   final double nipRadius;
//   final bool isSender;
//   final String? text;
//   final bool? tail;
//   final Color? color;
//   final bool? sent;
//   final bool? delivered;
//   final bool? seen;
//   final TextStyle? textStyle;
//   final BoxConstraints? constraints;

//   BubbleSpecialFour({
//     this.radius = 10,
//     this.nipHeight = 10,
//     this.nipWidth = 15,
//     this.nipRadius = 3,
//     this.isSender = true,
//     this.text,
//     this.tail,
//     this.color,
//     this.sent,
//     this.delivered,
//     this.seen,
//     this.textStyle,
//     this.constraints,
//   });

//   @override
//   Path getClip(Size size) {
//     var path = Path();

//     if (isSender) {
//       path.lineTo(size.width - nipRadius, 0);
//       path.arcToPoint(Offset(size.width - nipRadius, nipRadius),
//           radius: Radius.circular(nipRadius));
//       path.lineTo(size.width - nipWidth, nipHeight);
//       path.lineTo(size.width - nipWidth, size.height - radius);
//       path.arcToPoint(Offset(size.width - nipWidth - radius, size.height),
//           radius: Radius.circular(radius));
//       path.lineTo(radius, size.height);
//       path.arcToPoint(Offset(0, size.height - radius),
//           radius: Radius.circular(radius));
//       path.lineTo(0, radius);
//       path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));
//     } else if (!isSender) {
//       path.lineTo(size.width - radius, 0);
//       path.arcToPoint(Offset(size.width, radius),
//           radius: Radius.circular(radius));
//       path.lineTo(size.width, size.height - radius);
//       path.arcToPoint(Offset(size.width - radius, size.height),
//           radius: Radius.circular(radius));
//       path.lineTo(radius + nipWidth, size.height);
//       path.arcToPoint(Offset(nipWidth, size.height - radius),
//           radius: Radius.circular(radius));
//       path.lineTo(nipWidth, nipHeight);
//       path.lineTo(nipRadius, nipRadius);
//       path.arcToPoint(Offset(nipRadius, 0), radius: Radius.circular(nipRadius));
//     }

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
