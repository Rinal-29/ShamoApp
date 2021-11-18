import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel? product;
  const WishlistCard({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        right: 20,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      product: product,
                    ),
                  ),
                );
              },
              child: Container(
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        '${product!.galleries![0].url}',
                        width: 60,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product!.name}',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            '\$${product!.price}',
                            style: priceTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setWishlist(product);
            },
            child: Image.asset(
              'assets/success_icon.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
