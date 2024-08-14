import '../../../../core/failure/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase.dart';
import '../entities/products.dart';
import '../repositories/product_repository.dart';

class GetAllProduct implements UseCase<List<Products>, NoParams>{
  final ProductRepository repository;
  GetAllProduct(this.repository);

  @override
  Future<Either<Failure, List<Products>>> call(NoParams params) async {
    return await repository.GetAllProduct();
  }
  
}