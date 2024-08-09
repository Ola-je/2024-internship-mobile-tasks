import 'package:dartz/dartz.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/features/product/domain/entities/products.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, Products>> call(UpdateProductParam param) async {
    return await repository.UpdateProduct(param.product);
  }
}

class UpdateProductParam {
  final Products product;

  UpdateProductParam(this.product);
}
