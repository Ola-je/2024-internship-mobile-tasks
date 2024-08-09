import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/products.dart';
import '../repositories/product_repository.dart';

class GetProduct implements UseCase<Products, GetProductParam>{
  final ProductRepository repository;
  GetProduct(this.repository);

  Future<Either<Failure, Products>> call(GetProductParam param) async{
    return await repository.GetProduct(param.product);
  }
}

class GetProductParam{
  final Products product;
  const GetProductParam(this.product);
}