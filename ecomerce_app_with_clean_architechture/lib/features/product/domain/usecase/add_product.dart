import "package:dartz/dartz.dart";
import "package:task_6/features/product/domain/entities/products.dart";
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/core/usecase.dart';

class AddProduct implements UseCase<Products, AddProductParam>{
  final ProductRepository repository;
    AddProduct(this.repository);

  @override
  Future<Either<Failure, Products>> call(AddProductParam param) async{
    return await repository.CreateProduct(param.product);
  }
}

class AddProductParam {
  final Products product;

  const AddProductParam(this.product);
}