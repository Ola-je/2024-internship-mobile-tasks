import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecase/delete_product.dart';

import 'add_product_test.mocks.dart';


@GenerateMocks([ProductRepository])

void main(){
  late MockProductRepository mockProductRepository;
  late DeleteProduct usecase;

  setUp((){
    mockProductRepository = MockProductRepository();
    usecase = DeleteProduct(mockProductRepository);
  });


  final failure = Failure('Failed to delete product');

  test('This should Delete a product', ()async{
    const proId=1;
    when(mockProductRepository.DeleteProduct(proId))
    .thenAnswer((_) async => const Right(unit));

    final result = await usecase.call(const DeleteProductParam(proId));
    expect(result, const Right(unit));
    verify(mockProductRepository.DeleteProduct(proId));
    verifyNoMoreInteractions(mockProductRepository);
  });

  test('This should be an error when trying to delete product', ()async{
    const proId = 1;
    when(mockProductRepository.DeleteProduct(proId))
    .thenAnswer((_) async => Left(failure));

    final result = await usecase.call(const DeleteProductParam(proId));
    expect(result, Left(failure));
    verify(mockProductRepository.DeleteProduct(proId));
    verifyNoMoreInteractions(mockProductRepository);
  });
  
}
