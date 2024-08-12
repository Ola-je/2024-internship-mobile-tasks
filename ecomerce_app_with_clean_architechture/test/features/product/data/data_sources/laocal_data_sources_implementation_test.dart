import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/features/product/data/data_sources/local_data_sources_implementation.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])

void main() {
  late LocalDataSourcesImplementation localDataSource;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    localDataSource = LocalDataSourcesImplementation();
  });

  group('LocalDataSourcesImplementation', () {
    test('should retrieve a product by ID', () async {
      final product = ProductModel(
        id: 1,
        name: 'Test Product',
        description: 'A test product',
        price: 100,
        imagePath: 'path/to/image.png',
      );

      await sharedPreferences.setStringList(
        'products',
        [jsonEncode(product.toJson())],
      );

      final retrievedProducts = await localDataSource.GetProduct(product);
      print('retrievedProducts: $retrievedProducts');
      expect(retrievedProducts.length, 1);
      expect(retrievedProducts.first.id, product.id);
    });

    test('should return an error when trying to get a product', () async {
      final product = ProductModel(
        id: 1,
        name: 'Test Product',
        description: 'A test product',
        price: 100,
        imagePath: 'path/to/image.png',
      );

      final retrievedProducts = await localDataSource.GetProduct(product);
      expect(retrievedProducts.isEmpty, true);
    });
  });
}
