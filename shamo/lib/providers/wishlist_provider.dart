import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel>? _wishlist = [];

  List<ProductModel>? get wishlist => _wishlist;

  set wishlist(List<ProductModel>? wishlist) {
    _wishlist = wishlist;
  }

  // check if product is on wishlist or not
  // if true delete product
  // else add product
  isWhislist(ProductModel? product) {
    if (_wishlist!.indexWhere((element) => element.id == product!.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  setWishlist(ProductModel? product) {
    if (!isWhislist(product)) {
      _wishlist!.add(product!);
    } else {
      _wishlist!.removeWhere((element) => element.id == product!.id);
    }

    notifyListeners();
  }
}
