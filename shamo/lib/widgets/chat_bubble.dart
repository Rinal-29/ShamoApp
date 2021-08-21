import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  final String? text;
  final bool? isSender;
  final bool? hasProduct;

  ChatBubble({
    Key? key,
    this.text = '',
    this.isSender = false,
    this.hasProduct = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget ProductPreview() {
      return Container(
        width: 230,
        margin: EdgeInsets.only(
          bottom: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender! ? 12 : 0),
            topRight: Radius.circular(isSender! ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          color: isSender! ? bgColor5 : bgColor4,
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/image_shoes.png',
                    width: 70,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COURT VISION 2.0 SHOES',
                        style: primaryTextStyle,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$57,15',
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Add to cart',
                    style: purpleTextStyle,
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                      color: bgColor5,
                      fontWeight: medium,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 12,
      ),
      child: Column(
        crossAxisAlignment:
            isSender! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct! ? ProductPreview() : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender! ? 12 : 0),
                      topRight: Radius.circular(isSender! ? 0 : 12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: isSender! ? bgColor5 : bgColor4,
                  ),
                  child: Text(
                    text!,
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
