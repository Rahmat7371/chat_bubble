import 'package:audioplayers/audioplayers.dart';
import 'package:chat_ui_test/src/bubbles/bubble_normal.dart';
import 'package:chat_ui_test/src/bubbles/bubble_normal_audio.dart';
import 'package:chat_ui_test/src/bubbles/bubble_normal_image.dart';
import 'package:chat_ui_test/src/date_chips/date_chip.dart';
import 'package:chat_ui_test/src/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormalImage(
                  id: 'id001',
                  image: Image.network('https://i.ibb.co/JCyT1kT/Asset-1.png'),
                  tail: true,
                  delivered: true,
                ),
                BubbleNormalAudio(
                  color: const Color(0xFFE8E8EE),
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                ),
                const BubbleNormal(
                  text: 'bubble normal with tail',
                  isSender: false,
                  tail: true,
                ),
                const BubbleNormal(
                  text: 'bubble normal with tail ',
                  isSender: true,
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 2),
                ),
                const BubbleNormal(
                  text: 'bubble normal without tail',
                  isSender: false,
                  tail: false,
                ),
                const BubbleNormal(
                  text: 'bubble normal without tail',
                  tail: false,
                  sent: true,
                  seen: true,
                  delivered: true,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            onSend: (_) => print(_),
            actions: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).hintColor,
                    size: 24,
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.photo,
                    color: Theme.of(context).hintColor,
                    size: 24,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    const url =
        'https://file-examples.com/storage/fef1706276640fa2f99a5a4/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = const Duration();
        position = const Duration();
      });
    });
  }
}
