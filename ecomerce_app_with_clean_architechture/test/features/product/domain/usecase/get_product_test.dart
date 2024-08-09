import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/features/product/domain/entities/products.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecase/get_product.dart';

import 'get_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main(){
  late MockProductRepository mockProductRepository;
  late GetProduct usecase;

  setUp((){
    mockProductRepository = MockProductRepository();
    usecase = GetProduct(mockProductRepository);
  }
  );

  final product = Products(
      id: 1,
      name: 'shoe',
      description: 'a good shoe',
      price: 700,
      imagePath: 'imagePath',
    );

  final failure = Failure('failed to get product');

  test('This should get the product', ()async{
    when(mockProductRepository.GetProduct(product))
      .thenAnswer((_)async => Right(product));


    final result = await usecase.call(GetProductParam(product));
    expect(result, Right(product));
    verify(mockProductRepository.GetProduct(product));
    verifyNoMoreInteractions(mockProductRepository);
  });

  test('This should be an error when trying to get product', ()async{
    when(mockProductRepository.GetProduct(product))
      .thenAnswer((_)async => Left(failure));

    final result = await usecase.call(GetProductParam(product));
    expect(result, Left(failure));
    verify(mockProductRepository.GetProduct(product));
    verifyNoMoreInteractions(mockProductRepository);

  });

}