import 'package:task_6/features/product/data/models/product_model.dart';

import '../../domain/entities/products.dart';

abstract class LocalDataSources {
  Future<List<ProductModel>> GetProduct(ProductModel product);
}
