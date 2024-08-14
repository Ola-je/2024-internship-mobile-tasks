import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/features/product/data/data_sources/remote_data_sources_implementation.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

import 'remote_data_sources_implementation_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  final product = ProductModel(
    id: 1,
    name: 'bag',
    description: 'it is a bag',
    price: 200,
    imagePath: 'image/shoes.png',
  );
  late RemoteDataSourcesImplementation remoteDataSource;
  late MockClient mockClient;
  final String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1';
  setUp(() {
    mockClient = MockClient();
    remoteDataSource = RemoteDataSourcesImplementation(client: mockClient, baseUrl: baseUrl);
  });

  group('Remote data source add product test', () {
    test('This should return a ProductModel when the HTTP call completes successfully', () async {
      // Create the request you will send
      var request = http.MultipartRequest('POST', Uri.parse("$baseUrl/api/v1"));

      request.fields['id'] = product.id.toString();
      request.fields['name'] = product.name;
      request.fields['description'] = product.description;
      request.fields['price'] = product.price.toString();

      var imageFile = File(product.imagePath);
      request.files.add(await http.MultipartFile.fromPath('imagePath', imageFile.path));

      final responseJson = jsonEncode({
        'id': product.id,
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'imagePath': product.imagePath,
      });

      final r = http.StreamedResponse(
        Stream.fromIterable([utf8.encode(responseJson)]),
        201,
      );

      // Mock the behavior of the send method
      when(mockClient.send(any)).thenAnswer((_) async => r);

      // Call the method to test
      final result = await remoteDataSource.CreateProduct(product);

      // Verify the result
      expect(result, equals(product));
    });
 test('should throw an exception if the image file does not exist', () async {
      final invalidProduct = ProductModel(
        id: 1,
        name: 'Invalid Product',
        description: 'A product with an invalid image',
        price: 49,
        imagePath: 'invalid/path/to/image.png',
      );

      expect(() async => await remoteDataSource.CreateProduct(invalidProduct),
          throwsA(isA<Exception>()));
    });

  });

group('DeleteProduct', () {
    test('should delete product successfully when the server returns a 200 status code', () async {
      when(mockClient.delete(any)).thenAnswer(
        (_) async => http.Response('', 200),
      );

      await remoteDataSource.DeleteProduct(1);

      verify(mockClient.delete(Uri.parse('$baseUrl/products/1'))).called(1);
    });

    test('should throw an exception when the server returns a non-200 status code', () async {
      final responseJson = jsonEncode({
        'statusCode': 500,
        'message': 'Internal server error',
      });

      when(mockClient.delete(any)).thenAnswer(
        (_) async => http.Response(responseJson, 500),
      );

      expect(
        () async => await remoteDataSource.DeleteProduct(1),
        throwsA(isA<Exception>().having((e) => e.toString(), 'exception message', contains('Failed to delete product'))),
      );

      verify(mockClient.delete(Uri.parse('$baseUrl/products/1'))).called(1);
    });

    test('should throw an exception if an error occurs during the HTTP call', () async {
      // Simulate a network error
      when(mockClient.delete(any)).thenThrow(Exception('Network error'));

      // Expect the method to throw an exception
      expect(
        () async => await remoteDataSource.DeleteProduct(1),
        throwsA(isA<Exception>().having((e) => e.toString(), 'exception message', contains('Network error'))),
      );
    });
  });


  group('UpdateProduct', () {
    final product = ProductModel(
      id: 1,
      name: 'Updated Product',
      description: 'This is an updated product',
      price: 250,
      imagePath: 'image/updated_product.png',
    );

    test('should return a ProductModel when the HTTP call completes successfully', () async {
      final responseJson = jsonEncode({
        'id': product.id,
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'imagePath': product.imagePath,
      });

      when(mockClient.put(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer(
        (_) async => http.Response(responseJson, 200),
      );

      final result = await remoteDataSource.UpdateProduct(product);

      expect(result, equals(product));
      verify(mockClient.put(
        Uri.parse('$baseUrl/products/${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'imagePath': product.imagePath,
        }),
      )).called(1);
    });

    test('should throw an exception when the server returns a non-200 status code', () async {
      final responseJson = jsonEncode({
        'statusCode': 500,
        'message': 'Internal server error',
      });

      when(mockClient.put(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer(
        (_) async => http.Response(responseJson, 500),
      );

      expect(
        () async => await remoteDataSource.UpdateProduct(product),
        throwsA(isA<Exception>().having((e) => e.toString(), 'exception message', contains('Failed to update product'))),
      );

      verify(mockClient.put(
        Uri.parse('$baseUrl/products/${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'imagePath': product.imagePath,
        }),
      )).called(1);
    });

    test('should throw an exception if an error occurs during the HTTP call', () async {
      when(mockClient.put(any, headers: anyNamed('headers'), body: anyNamed('body')))
          .thenThrow(Exception('Network error'));

      expect(
        () async => await remoteDataSource.UpdateProduct(product),
        throwsA(isA<Exception>().having((e) => e.toString(), 'exception message', contains('Network error'))),
      );
    });
  });

    group('GetProduct', () {
    final product = ProductModel(
      id: 1,
      name: 'Test Product',
      description: 'This is a test product',
      price: 100,
      imagePath: 'image/test_product.png',
    );

    test('should return a list of ProductModel when the HTTP call completes successfully', () async {
      final responseJson = jsonEncode([
        {
          'id': product.id,
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'imagePath': product.imagePath,
        }
      ]);

      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(responseJson, 200),
      );

      final result = await remoteDataSource.GetProduct(product);

      expect(result, isA<List<ProductModel>>());
      expect(result, equals(product));
      verify(mockClient.get(Uri.parse('$baseUrl/products/${product.id}'))).called(1);
    });

    test('should throw an exception when the server returns a non-200 status code', () async {
      final responseJson = jsonEncode({
        'statusCode': 500,
        'message': 'Internal server error',
      });

      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(responseJson, 500),
      );

      expect(
        () async => await remoteDataSource.GetProduct(product),
        throwsA(isA<Exception>().having((e) => e.toString(), 'exception message', contains('Failed to fetch products'))),
      );

      verify(mockClient.get(Uri.parse('$baseUrl/products/${product.id}'))).called(1);
    });

    test('should throw an exception if an error occurs during the HTTP call', () async {
      // Simulate a network error
      when(mockClient.get(any)).thenThrow(Exception('Network error'));

      // Expect the method to throw an exception
      expect(
        () async => await remoteDataSource.GetProduct(product),
        throwsA(isA<Exception>().having((e) => e.toString(), 'exception message', contains('Network error'))),
      );
    });
  });

}
