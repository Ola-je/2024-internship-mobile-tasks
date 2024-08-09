import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/features/product/domain/entities/products.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecase/update_product.dart';

import 'update_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late UpdateProduct usecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = UpdateProduct(mockProductRepository);
  });

  final product = Products(
    id: 1,
    name: 'shoe',
    description: 'a good shoe',
    price: 700,
    imagePath: 'imagePath',
  );

  final failure = Failure('failed to Update product');

  test('This should Update the Product', () async {
    when(mockProductRepository.UpdateProduct(product))
        .thenAnswer((_) async => Right(product));

    final result = await usecase.call(UpdateProductParam(product));
    expect(result, Right(product));
    verify(mockProductRepository.UpdateProduct(product));
    verifyNoMoreInteractions(mockProductRepository);
  });
  
  test('This should be an error when trying to update a product', ()async{
    when(mockProductRepository.UpdateProduct(product))
      .thenAnswer((_)async => left(failure));

    final result = await usecase.call(UpdateProductParam(product));
    expect(result, left(failure));
    verify(mockProductRepository.UpdateProduct(product));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
