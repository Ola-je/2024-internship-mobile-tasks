import '../../domain/entities/products.dart';

class ProductModel extends Products{
  const ProductModel({
    required String id,
    required String name,
    required String  description,
    required double price,
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
    price: (json['price'] as num?)?.toDouble() ?? 49.0,  
    imagePath: json['imageUrl'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'imagePath': imagePath
  };

  Products toEntity() {
    return Products(
      id: id,
      name: name,
      description: description,
      price: price,
      imagePath: imagePath,
    );
  }
}