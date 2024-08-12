import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/data_sources/local_data_sources.dart';

class LocalDataSourcesImplementation implements LocalDataSources {
  static const String _productsKey = 'products';

  @override
  Future<List<ProductModel>> GetProduct(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = prefs.getStringList(_productsKey) ?? [];
    
    final products = productsJson
        .map((productJson) => ProductModel.fromJson(jsonDecode(productJson)))
        .toList();
    
    return products.where((p) => p.id == product.id).toList();
  }

}
