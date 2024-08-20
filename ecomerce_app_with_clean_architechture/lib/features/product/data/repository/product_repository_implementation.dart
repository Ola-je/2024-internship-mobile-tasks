import 'package:dartz/dartz.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/core/network/network_info_implementation.dart';
import 'package:task_6/features/product/data/data_sources/local_data_sources.dart';
import 'package:task_6/features/product/data/data_sources/remote_data_sources.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/domain/entities/products.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImplementation implements ProductRepository {
  final RemoteDataSources remoteDataSources;
  final LocalDataSources localDataSources;
  final NetworkInfo networkInfo;

  ProductRepositoryImplementation({
    required this.remoteDataSources,
    required this.localDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductModel>> CreateProduct(Products product) async {
    if (await networkInfo.isConnected) {
      try {
        final productModel = ProductModel(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          imagePath: product.imagePath,
        );
        final result = await remoteDataSources.CreateProduct(productModel);
        return Right(result);
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    } else {
      return Left(Failure('No Internet Connection'));
    }
  }


  @override
  Future<Either<Failure, Unit>> DeleteProduct(String id) async {
    try {
      await remoteDataSources.DeleteProduct(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
   Future<Either<Failure, Products>> GetProduct(Products product) async {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        imagePath: product.imagePath,
      );

      final productModels = await localDataSources.GetProduct(productModel);
      if (productModels.isNotEmpty) {
        return Right(productModels.first);
      } else {
        return Left(Failure('Product not found'));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Products>> UpdateProduct(Products product) async {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        imagePath: product.imagePath,
      );
      final updatedProduct = await remoteDataSources.UpdateProduct(productModel);
      return Right(updatedProduct);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> GetAllProduct() async{
    try{
      final products = await remoteDataSources.GetAllProduct();
      return Right(products);
    }
    catch(e){
      return Left(Failure(e.toString()));
    }
  }
}
