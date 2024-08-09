import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:task_6/features/product/domain/entities/products.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecase/add_product.dart';
import 'package:task_6/core/failure/failure.dart';
import 'add_product_test.mocks.dart';


@GenerateMocks([ProductRepository])
void main(){
  late MockProductRepository mockProductRepository;
  late AddProduct usecase;

  setUp((){
    mockProductRepository = MockProductRepository();
    usecase = AddProduct(mockProductRepository);
  }
  );

  final product = Products(
    id: 1,
    name: 'shoe',
    description: 'a good shoe', 
    price: 700,  
    imagePath: 'imagePath');

  final failure = Failure('failed to add product');

  test('This should add a product', ()async{
    when(mockProductRepository.CreateProduct(product))
      .thenAnswer((_) async => Right(product));

    final result = await usecase.call(AddProductParam(product));
    expect(result, Right(product));
    verify(mockProductRepository.CreateProduct(product));
    verifyNoMoreInteractions(mockProductRepository);

  });

  test('This should be an error when failing to add product', ()async{
    when(mockProductRepository.CreateProduct(product))
    .thenAnswer((_) async => Left(failure));

    final result = await usecase.call(AddProductParam(product));
    expect(result, Left(failure));
    verify(mockProductRepository.CreateProduct(product));
    verifyNoMoreInteractions(mockProductRepository);
  }
  );

}

