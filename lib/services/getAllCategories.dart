import 'package:store_app/helper/Api.dart';

class Getallcategories {
  Future<List<dynamic>> getallcategories() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
