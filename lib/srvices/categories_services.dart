
import 'package:storapp/models/product_model.dart';

import '../helper/api.dart';

class CategoriesServices {
  Future<List<dynamic>> getCategoriesProducts(
      {required String categoryname}) async {
    List<dynamic> data =
    await Api().get(url: 'https://fakestoreapi.com/${categoryname}');
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromjson(data[i]),
        );
      }
      return productsList;


  }
}
