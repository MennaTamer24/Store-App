// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/screens/widgets/productCard.dart';
import 'package:store_app/services/getAllProducts.dart';
import 'package:store_app/models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('New Trend', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 70, right: 16, left: 16),
        child: FutureBuilder(
          future: AllproductsServices().getallproducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> allProduct = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 100,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.1,
                ),
                itemCount: allProduct.length,
                itemBuilder: (context, index) {
                  final product = allProduct[index];
                  return productCard(product, context, () => setState(() {}));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
