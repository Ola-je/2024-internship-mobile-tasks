import 'package:dartz/dartz.dart';
import 'package:task_6/core/failure/failure.dart';
import '../repositories/product_repository.dart';
import 'package:task_6/core/usecase.dart';

class DeleteProduct implements UseCase<Unit, DeleteProductParam>{
  final ProductRepository repository;
  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteProductParam param)async{
    return await repository.DeleteProduct(param.id);
  }
}
class DeleteProductParam{
  final String id;
  const DeleteProductParam(this.id);
}