// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null
          ? Rating.fromMap(json['rating'])
          : Rating(rate: 0.0, count: 0),
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromMap(ratingMap) {
    return Rating(
      rate: double.tryParse(ratingMap['rate'].toString()) ?? 0.0,
      count: ratingMap['count'] ?? 0,
    );
  }
}
