import 'package:equatable/equatable.dart';

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
}