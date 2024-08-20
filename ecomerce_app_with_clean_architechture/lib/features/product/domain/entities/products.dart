import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

class Products extends Equatable{
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;

  const Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    
  }
  );
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, price, imagePath];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
    };
  }

  ProductModel toModel() {
    return ProductModel(
      id: id,
      name: name,
      description: description,
      price: price,
      imagePath: imagePath,
    );
  }
}