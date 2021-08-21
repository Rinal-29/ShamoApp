import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatpage extends StatelessWidget {
  const DetailChatpage({Key? key}) : super(key: key);

  PreferredSizeWidget header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: bgColor1,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/image_shop_online.png',
              width: 50,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Store',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget productPreview() {
    return Container(
      height: 74,
      width: 225,
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor5,
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 54,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COURT VISION 2.0 aaaaa',
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$57,15',
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/close_icon.png',
            height: 22,
          ),
        ],
      ),
    );
  }

  Widget inputChat() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          productPreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: bgColor4,
                  ),
                  child: Center(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type Message..',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/send_button.png',
                width: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: [
        ChatBubble(
          isSender: true,
          hasProduct: true,
          text: 'Hi, This item is still available ?, This item is still sir ?',
        ),
        ChatBubble(
          isSender: true,
          text: 'This item is still sir ?',
        ),
        ChatBubble(
          isSender: false,
          text: 'Hi, This item is available !!',
        ),
        ChatBubble(
          isSender: false,
          text: 'Thankyou Admin',
        ),
        ChatBubble(
          isSender: true,
          text: 'Ur Welcome',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      bottomNavigationBar: inputChat(),
      body: content(),
    );
  }
}
