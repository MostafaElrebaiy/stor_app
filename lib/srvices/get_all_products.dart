import 'package:storapp/helper/api.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List <dynamic>data = await Api().get(url: 'https://fakestoreapi.com/products', token: '');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productsList;
  }
}
