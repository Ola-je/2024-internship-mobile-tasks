part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProductEvent extends ProductEvent{
  const LoadAllProductEvent();
  
  @override
  List<Object> get props => [];
}
class GetSingleProductEvent extends ProductEvent{
  final int id;
  const GetSingleProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
class UpdateProductEvent extends ProductEvent{
  final int id;
  final int price;
  final String name;
  final String description;

  const UpdateProductEvent(this.id, this.price, this.name, this.description);

  @override
  List<Object> get props => [id, price, name, description];
}
class DeleteProductEvent extends ProductEvent{
  final int id;
  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
class CreateProductEvent extends ProductEvent{
  final int id;
  final int price;
  final String name;
  final String description;
  final String imagePath;
  const CreateProductEvent(this.id, this.price, this.name, this.description, this.imagePath);

  @override
  List<Object> get props => [id, price, name, description, imagePath];
}
