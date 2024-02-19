import 'package:chat_ui_test/utils.dart';
import 'package:flutter/material.dart';

class MessageBar extends StatelessWidget {
  final bool replying;
  final String? replyingTo;
  final List<Widget> actions;
  final TextEditingController _textController = TextEditingController();
  final Color? replyWidgetColor;
  final Color? replyIconColor;
  final Color? replyCloseColor;
  final Color? messageBarColor;
  final String? messageBarHintText;
  final TextStyle? messageBarHintStyle;
  final TextStyle? textFieldTextStyle;
  final Color? sendButtonColor;
  final Color? cursorColor;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;

  MessageBar({
    super.key,
    this.replying = false,
    this.replyingTo = "",
    this.actions = const [],
    this.replyWidgetColor,
    this.replyIconColor,
    this.replyCloseColor,
    this.messageBarColor,
    this.sendButtonColor,
    this.messageBarHintText = "Type your message here",
    this.messageBarHintStyle = const TextStyle(fontSize: 16),
    this.textFieldTextStyle,
    this.onTextChanged,
    this.onSend,
    this.onTapCloseReply,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            replying
                ? Container(
                    color: replyWidgetColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: replyIconColor,
                          size: 24,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Re : $replyingTo',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapCloseReply,
                          child: Icon(
                            Icons.close,
                            color: replyCloseColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ))
                : Container(),
            replying
                ? Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  )
                : Container(),
            Container(
              color: messageBarColor ?? theme.cardColor,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: TextField(
                        cursorColor: cursorColor ?? Utils.sendButtonColor,
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: onTextChanged,
                        style: textFieldTextStyle ?? theme.textTheme.bodyLarge,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [...actions],
                            ),
                          ),
                          hintText: messageBarHintText,
                          hintMaxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          hintStyle: messageBarHintStyle,
                          fillColor: theme.brightness == Brightness.dark
                              ? Utils.textFieldFilledDarkColor
                              : Utils.textFieldFilledLightColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      child: Icon(
                        Icons.send,
                        color: sendButtonColor ?? Utils.sendButtonColor,
                        size: 24,
                      ),
                      onTap: () {
                        if (_textController.text.trim() != '') {
                          if (onSend != null) {
                            onSend!(_textController.text.trim());
                          }
                          _textController.text = '';
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
