import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;
  bool isWhislist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (defaultMargin * 2),
          child: AlertDialog(
            backgroundColor: bgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Icon.png',
                    width: 100,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'item added successfuly',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 44,
                    width: 154,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: bgColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 290,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: bgColor1,
        ),
        child: Column(
          children: [
            // NOTE: Header Content
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERREX URBAN LOW',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        'Hiking',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWhislist = !isWhislist;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              isWhislist ? secondaryColor : alertColor,
                          content: Text(
                            isWhislist
                                ? 'Berhasil menambah wishlist'
                                : 'Berhasil menghapus wislisht',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      isWhislist
                          ? 'assets/success_icon.png'
                          : 'assets/button_wishist.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: Price Content
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Starts From',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$123,123',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),

            // NOTE: Description Content
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // NOTE: Image Gallery
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0,
                          ),
                          child: familiarShoesCard(image),
                        );
                      }).toList(),
                    ),
                  ),

                  // NOTE: Button
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(defaultMargin),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail-chat');
                          },
                          child: Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/button_chat.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 54,
                            child: TextButton(
                              onPressed: () {
                                showSuccessDialog();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Add to cart',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
