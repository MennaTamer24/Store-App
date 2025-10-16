import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/product_model.dart';

class AllproductsServices {
  Future<List<ProductModel>> getallproducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );

    List<ProductModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      allProducts.add(ProductModel.fromJson(data[i]));
    }
    return allProducts;
  }
}
