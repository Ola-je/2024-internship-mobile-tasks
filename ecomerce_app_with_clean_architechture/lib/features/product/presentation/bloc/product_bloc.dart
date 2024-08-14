import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/input_converter.dart';
import '../../../../models/product.dart';
import '../../domain/usecase/add_product.dart';
import '../../domain/usecase/delete_product.dart';
import '../../domain/usecase/get_product.dart';
import '../../domain/usecase/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final AddProduct addProduct;
  final GetProduct getProduct;
  // final GetAllProduct getAllProduct;
  final DeleteProduct deleteProduct;
  final UpdateProduct updateProduct;
  final InputConverter inputConverter;

  ProductBloc( {
    required this.addProduct,
    required this.getProduct,
    // required this.getAllProduct,
    required this.deleteProduct,
    required this.updateProduct,
    required this.inputConverter, 
  }): super(InitialState()) {
    on<ProductEvent>((event, emit) {});

  // ProductState get initialState => Empty();
  //  : super(InitialState()) {
  //   on<ProductEvent>((event, emit) {});

  // ProductBloc() : super(InitialState()) {
  //   on<ProductEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  }}