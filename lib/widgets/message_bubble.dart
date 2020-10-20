import "package:flutter/material.dart";
import "package:flash_chat/utils/theme.dart";

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageBubble({this.sender, this.text, this.isMe});

  BorderRadius setBubbleShape() {
    return this.isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(kSizeLarger),
            bottomLeft: Radius.circular(kSizeLarger),
            bottomRight: Radius.circular(kSizeLarger),
          )
        : BorderRadius.only(
            topRight: Radius.circular(kSizeLarger),
            bottomLeft: Radius.circular(kSizeLarger),
            bottomRight: Radius.circular(kSizeLarger),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kSizeSmall),
      child: Column(
        crossAxisAlignment:
            this.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            this.sender,
            style: TextStyle(
              fontSize: 12.0,
              color: kGreyColor,
            ),
          ),
          SizedBox(height: kSizeSmall),
          Material(
            color: this.isMe ? kAccentColor : Colors.white,
            elevation: 4.0,
            borderRadius: this.setBubbleShape(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSizeMedium,
                vertical: kSizeSmall,
              ),
              child: Text(
                this.text,
                style: TextStyle(
                  color: this.isMe ? kLightColor : kDarkColor,
                  fontSize: kSizeMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
