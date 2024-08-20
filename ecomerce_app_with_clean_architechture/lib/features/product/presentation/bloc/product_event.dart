part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProductEvent extends ProductEvent{
  const LoadAllProductEvent();
  
  // @override
  // List<Object> get props => [];
}

class GetSingleProductEvent extends ProductEvent{
  final Products product;
  const GetSingleProductEvent(this.product);

  @override
  List<Object> get props => [product];
}
class UpdateProductEvent extends ProductEvent{
  final Products product;
  const UpdateProductEvent(this.product);
  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent{
  final String id;
  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}

class CreateProductEvent extends ProductEvent{
  final String id;
  final double price;
  final String name;
  final String description;
  final String imagePath;
  const CreateProductEvent(this.id, this.price, this.name, this.description, this.imagePath);

  @override
  List<Object> get props => [id, price, name, description, imagePath];
}
