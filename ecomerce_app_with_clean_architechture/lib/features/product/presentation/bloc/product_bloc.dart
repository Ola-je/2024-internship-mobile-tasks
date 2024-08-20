import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase.dart';
import '../../../../core/util/input_converter.dart';
import '../../domain/entities/products.dart';
import '../../domain/usecase/add_product.dart';
import '../../domain/usecase/delete_product.dart';
import '../../domain/usecase/get_all_product.dart';
import '../../domain/usecase/get_product.dart';
import '../../domain/usecase/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final AddProduct addProduct;
  final GetProduct getProduct;
  final GetAllProduct getAllProduct;
  final DeleteProduct deleteProduct;
  final UpdateProduct updateProduct;
  final InputConverter inputConverter;

  ProductBloc({
    required this.addProduct,
    required this.getProduct,
    required this.getAllProduct,
    required this.deleteProduct,
    required this.updateProduct,
    required this.inputConverter,
  }) : super(InitialState()){
    on<LoadAllProductEvent>(loadProduct);
    on<GetSingleProductEvent>(getSingleProduct);
    on<DeleteProductEvent>(delete_product);
    on<UpdateProductEvent>(update_product);
    on<CreateProductEvent>(create_product);
  }

  // @override
  // Stream<ProductState> mapEventToState(ProductEvent event) async*{
  //   if (event is LoadAllProductEvent){
  //     yield LoadingState();
  //     final result = await getAllProduct(NoParams());

  //     result.fold((failure) async*{
  //       yield ErrorState(failure.message);
  //     },
  //     (data) async*{
  //       yield LoadedAllProductState(products: data);
  //     });
  //   }

  //   else if (event is GetSingleProductEvent){
  //     yield LoadingState();
  //     final product = Products(
  //       id: event.product.id,
  //       name: event.product.name,
  //       description: event.product.description,
  //       price: event.product.price,
  //       imagePath: event.product.imagePath,
  //     );

  //     final result = await getProduct(GetProductParam(product));

  //     result.fold((failure) async*{
  //       yield ErrorState(failure.message);
  //     },
  //     (data) async*{
  //       yield LoadedSingleProductState(product: data);
  //     });
  //   }

  //   else if (event is DeleteProductEvent){
      // yield(LoadingState());
      // final result = await deleteProduct(DeleteProductParam(event.id));

      // result.fold((failure) async*{
      //   yield ErrorState(failure.message);
      // },
      // (data) async*{
      //   yield InitialState();
      // });
  //   }

  //   else if (event is UpdateProductEvent){
  //     yield(LoadingState());

  //     final idResult = inputConverter.stringToUnsignedInteger(event.product.id.toString());
  //     final priceResult = inputConverter.stringToUnsignedInteger(event.product.price.toString());

  //     idResult.fold((failure) async*{
  //       yield ErrorState('Invalid ID');
  //     },
  //     (id){
  //       priceResult.fold((failure) async*{
  //         yield ErrorState('Invalid Price');
  //       },
  //       (price) async{
  //         final product = Products(
  //           id: id,
  //           name: event.product.name,
  //           description: event.product.description,
  //           price: price,
  //           imagePath: event.product.imagePath,
  //         );

  //         final result = await updateProduct(UpdateProductParam(event.product));
  //         result.fold((failure) async*{
  //           yield ErrorState(failure.message);
  //         },
  //         (data) async*{
  //           yield LoadedSingleProductState(product: data);
  //         });
  //       });
  //     });
  //   }

  //   else if(event is CreateProductEvent){
    //   yield(LoadingState());

    //  final priceResult = inputConverter.stringToUnsignedInteger(event.price.toString());

    //  priceResult.fold((failure) async*{
    //   yield ErrorState('Invalid Price');
    //  },
    //  (price) async{
    //   final product = Products(
    //     id: 0,
    //     name: event.name,
    //     description: event.description,
    //     price: price,
    //     imagePath: event.imagePath,
    //   );

    //   final result = await addProduct(AddProductParam(product));

    //   result.fold((failure) async*{
    //     yield ErrorState(failure.message);
    //   },
    //   (data) async*{
    //     yield LoadedSingleProductState(product: data);
    //   });
    //  });j
  //   }
  // }
  

  FutureOr<void> loadProduct(LoadAllProductEvent event, Emitter<ProductState> emit) async  {
    emit(LoadingState());
      final result = await getAllProduct(NoParams());

      result.fold((failure) {
        emit (ErrorState(failure.message));
      },
      (data) {
        emit (LoadedAllProductState(products: data));
      });
  }

  FutureOr<void> getSingleProduct(GetSingleProductEvent event, Emitter<ProductState> emit) async  {
     emit(LoadingState());
      final product = Products(
        id: event.product.id,
        name: event.product.name,
        description: event.product.description,
        price: event.product.price,
        imagePath: event.product.imagePath,
      );

      final result = await getProduct(GetProductParam(product));

      result.fold((failure){
       emit(ErrorState(failure.message));
      },
      (data) {
        emit(LoadedSingleProductState(product: data));
      });
  }

  FutureOr<void> delete_product(DeleteProductEvent event, Emitter<ProductState> emit) async  {
    
    emit(LoadingState());
      final result = await deleteProduct(DeleteProductParam(event.id));

      result.fold((failure){
        emit(ErrorState(failure.message));
      },
      (data) {
        add(LoadAllProductEvent());
        // emit(LoadedAllProductState(products: data));
      });
  }

  FutureOr<void> update_product(UpdateProductEvent event, Emitter<ProductState> emit) async  {
    emit(LoadingState());      
        final product = Products(
          id: event.product.id,
          name: event.product.name,
          description: event.product.description,
          price: event.product.price,
          imagePath: event.product.imagePath,
        );

        final result = await updateProduct(UpdateProductParam(event.product));
        result.fold((failure){
          emit(ErrorState(failure.message));
        },
        (data) {
          // emit(LoadedSingleProductState(product: data));
          add(LoadAllProductEvent());

        });
  }

  FutureOr<void> create_product(CreateProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingState());

    //  final priceResult = inputConverter.stringToUnsignedInteger(event.price.toString());

    //  priceResult.fold((failure) {
    //   emit (ErrorState('Invalid Price'));
    //  },
    //  (price) async{
      final product = Products(
        id: event.id,
        name: event.name,
        description: event.description,
        price: event.price,
        imagePath: event.imagePath,
      );

      final result = await addProduct(AddProductParam(product));

      result.fold((failure) {
        emit (ErrorState(failure.message));
      },
      (data) {
        emit (LoadedSingleProductState(product: data));
        add(LoadAllProductEvent());
      });
    //  });
  }
}