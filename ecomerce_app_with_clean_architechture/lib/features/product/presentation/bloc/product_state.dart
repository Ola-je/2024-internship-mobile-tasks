part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class InitialState extends ProductState {}

final class LoadingState extends ProductState {
  
}

final class LoadedAllProductState extends ProductState {
  final List<Products> products;

  LoadedAllProductState({required this.products});

  @override
  List<Object> get props => [products];
}   

final class LoadedSingleProductState extends ProductState {
  final Products product;

  LoadedSingleProductState({required this.product});

  @override
  List<Object> get props => [product];
}

final class ErrorState extends ProductState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
