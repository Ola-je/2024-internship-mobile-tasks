import 'package:task_6/features/product/data/models/product_model.dart';

abstract class LocalDataSources {
  Future<List<ProductModel>> GetProduct(ProductModel product);
}
