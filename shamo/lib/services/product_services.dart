// NOTE: get data product from backend
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductServices {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>?> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      print(response.body);

      for (var item in datas) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal mendapatkan product');
    }
  }
}
