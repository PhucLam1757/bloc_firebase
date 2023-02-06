// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int id;
  final String name;
  final String description;
  final int originalPrice;
  final int saleOffPrice;
  final String image;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.saleOffPrice,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        name: json['name'],
        description: json['description'],
        originalPrice: json['originalPrice'],
        saleOffPrice: json['saleOffPrice'],
        image: json['image']);
  }
}
