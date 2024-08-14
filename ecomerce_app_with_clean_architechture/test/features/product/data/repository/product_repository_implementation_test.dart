import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/failure/failure.dart';
import 'package:task_6/core/network/network_info_implementation.dart';
import 'package:task_6/features/product/data/data_sources/local_data_sources.dart';
import 'package:task_6/features/product/data/data_sources/remote_data_sources.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/repository/product_repository_implementation.dart';
import 'package:task_6/features/product/domain/entities/products.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([RemoteDataSources, LocalDataSources, InternetConnectionChecker])
// import 'product_repository_implementation_test.mocks.dart';

void main() {
//   late MockRemoteDataSources mockRemoteDataSources;
//   late MockLocalDataSources mockLocalDataSources;
//   late MockInternetConnectionChecker mockInternetConnectionChecker;
//   late ProductRepositoryImplementation productRepository;
//   late NetworkInfoImplementation networkInfo;

//   setUp(() {
//     mockRemoteDataSources = MockRemoteDataSources();
//     mockLocalDataSources = MockLocalDataSources();
//     mockInternetConnectionChecker = MockInternetConnectionChecker();
//     networkInfo = NetworkInfoImplementation(mockInternetConnectionChecker);

//     productRepository = ProductRepositoryImplementation(
//       remoteDataSources: mockRemoteDataSources,
//       localDataSources: mockLocalDataSources,
//       networkInfo: networkInfo,
//     );
//   });

//   test('should return a product when CreateProduct succeeds', () async {
//     final product = Products(
//       id: 1,
//       name: 'Product Name',
//       description: 'Product Description',
//       price: 100,
//       imagePath: 'path/to/image',
//     );

//     final productModel = ProductModel(
//       id: product.id,
//       name: product.name,
//       description: product.description,
//       price: product.price,
//       imagePath: product.imagePath,
//     );

//     when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
//     when(mockRemoteDataSources.CreateProduct(productModel)).thenAnswer(
//       (_) async => productModel,
//     );

//     final result = await productRepository.CreateProduct(product);

//     expect(result, Right(productModel));
//     verify(mockRemoteDataSources.CreateProduct(productModel)).called(1);
//   });

//   test('should return Failure when CreateProduct fails due to no internet connection', () async {
//   final product = Products(
//     id: 1,
//     name: 'Product Name',
//     description: 'Product Description',
//     price: 100,
//     imagePath: 'path/to/image',
//   );

//   when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => false);

//   final result = await productRepository.CreateProduct(product);

//   expect(result, isA<Left<Failure, ProductModel>>()
//     .having((left) => left.value, 'value', isA<Failure>().having((failure) => failure.message, 'message', 'No Internet Connection'))
//   );

//   verifyNever(mockRemoteDataSources.CreateProduct(any));
// });
}
