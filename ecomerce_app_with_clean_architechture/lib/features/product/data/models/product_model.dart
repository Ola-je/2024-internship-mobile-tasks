import '../../domain/entities/products.dart';

class ProductModel extends Products{
  const ProductModel({
    required int id,
    required String name,
    required String  description,
    required int price,
    required String imagePath,
  }) : super(
    id: id,
    name: name,
    description: description,
    price: price,
    imagePath: imagePath,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    price: json['price'],
    imagePath: json['imagePath'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'imagePath': imagePath
  };
}