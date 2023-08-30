import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storapp/models/product_model.dart';
import 'package:storapp/widgets/custom_button.dart';
import 'package:storapp/widgets/custom_text_field.dart';

import '../srvices/update_product.dart';

class UpdataProductPage extends StatefulWidget {
  UpdataProductPage({super.key});
  static String id = 'UpdataProductPage';

  @override
  State<UpdataProductPage> createState() => _UpdataProductPageState();
}

class _UpdataProductPageState extends State<UpdataProductPage> {
  String? productName, description, image, price, category;
  bool isloading = false;
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'product Name',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: 'description',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image ',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButon(
                    onTap: () async {

                      isloading = true;
                      setState(() {});

                      try {
                                                                    await updateProduct(product);

                        print('success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isloading = false;
                      setState(() {});
                    },
                    text: 'Update'),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
