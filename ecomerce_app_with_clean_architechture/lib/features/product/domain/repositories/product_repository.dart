import 'package:dartz/dartz.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/features/product/domain/entities/products.dart';

abstract class ProductRepository{
  Future<Either<Failure, Products>> CreateProduct(Products product);
  Future<Either<Failure, Unit>> DeleteProduct(String id);
  Future<Either<Failure, Products>> UpdateProduct(Products product);
  Future<Either<Failure, Products>> GetProduct(Products product);
  Future<Either<Failure, List<Products>>>GetAllProduct();
  
}