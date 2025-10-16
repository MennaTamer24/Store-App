import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/updatePage.dart';

Widget productCard(ProductModel product, context, VoidCallback onUpdated) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .pushNamed(UpdatePage.id, arguments: product)
          .then((_) => onUpdated()); // ← هنا التحديث بعد الرجوع
    },
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(10, 10),
                blurRadius: 40,
                spreadRadius: 0,
              ),
            ],
          ),
          height: 120,
          width: 220,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toString()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 30,
          child: Image.network(product.image, height: 100, width: 80),
        ),
      ],
    ),
  );
}
