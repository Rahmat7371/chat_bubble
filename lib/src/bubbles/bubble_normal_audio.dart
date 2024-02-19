import 'package:chat_ui_test/utils.dart';
import 'package:flutter/material.dart';

const double bubbleRadiusAudio = 16;

class BubbleNormalAudio extends StatelessWidget {
  final void Function(double value) onSeekChanged;
  final void Function() onPlayPauseButtonClick;
  final bool isPlaying;
  final bool isPause;
  final double? duration;
  final double? position;
  final bool isLoading;
  final double bubbleRadius;
  final bool isSender;
  final Color? color;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const BubbleNormalAudio({
    Key? key,
    required this.onSeekChanged,
    required this.onPlayPauseButtonClick,
    this.isPlaying = false,
    this.constraints,
    this.isPause = false,
    this.duration,
    this.position,
    this.isLoading = true,
    this.bubbleRadius = bubbleRadiusAudio,
    this.isSender = true,
    this.color,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 12,
    ),
  }) : super(key: key);

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
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
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
            : Container(),
        Container(
          color: Colors.transparent,
          constraints: constraints ??
              BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8,
                  maxHeight: 70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
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
                      : bubbleRadiusAudio),
                  bottomRight: Radius.circular(tail
                      ? isSender
                          ? 2.5
                          : bubbleRadius
                      : bubbleRadiusAudio),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      RawMaterialButton(
                        onPressed: onPlayPauseButtonClick,
                        elevation: 1.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        shape: const CircleBorder(),
                        child: !isPlaying
                            ? const Icon(
                                Icons.play_arrow,
                                size: 30.0,
                              )
                            : isLoading
                                ? const CircularProgressIndicator()
                                : isPause
                                    ? const Icon(
                                        Icons.play_arrow,
                                        size: 30.0,
                                      )
                                    : const Icon(
                                        Icons.pause,
                                        size: 30.0,
                                      ),
                      ),
                      Expanded(
                        child: Slider(
                          min: 0.0,
                          max: duration ?? 0.0,
                          value: position ?? 0.0,
                          onChanged: onSeekChanged,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 8,
                    right: 25,
                    child: Text(
                      audioTimer(duration ?? 0.0, position ?? 0.0),
                      style: textStyle,
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
      ],
    );
  }

  String audioTimer(double duration, double position) {
    return '${(duration ~/ 60).toInt()}:${(duration % 60).toInt().toString().padLeft(2, '0')}/${position ~/ 60}:${(position % 60).toInt().toString().padLeft(2, '0')}';
  }
}
