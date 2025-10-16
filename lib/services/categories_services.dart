import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> categoriesServices(String categoryName) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProductModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      allProducts.add(ProductModel.fromJson(data[i]));
    }
    return allProducts;
  }
}
