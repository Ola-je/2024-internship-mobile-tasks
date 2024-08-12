import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

class Products extends Equatable{
  final int id;
  final String name;
  final String description;
  final int price;
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
  List<Object?> get props => [id,];

  Object? toJson() {}
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