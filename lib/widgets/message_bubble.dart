import "package:flutter/material.dart";
import "package:flash_chat/utils/theme.dart";

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  MessageBubble({this.sender, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kSizeSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
            color: kAccentColor,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(kSizeLarger),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSizeMedium,
                vertical: kSizeSmall,
              ),
              child: Text(
                this.text,
                style: TextStyle(
                  color: kLightColor,
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
