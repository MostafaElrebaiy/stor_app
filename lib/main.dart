import 'package:flutter/material.dart';
import 'package:storapp/pages/home_page.dart';
import 'package:storapp/pages/updata_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id :(context)=>HomePage(),
        UpdataProductPage.id:(context)=>UpdataProductPage(),

      },


    );
  }}
