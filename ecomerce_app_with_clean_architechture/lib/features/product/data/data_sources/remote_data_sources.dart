import '../models/product_model.dart';

abstract class RemoteDataSources{
  Future<ProductModel>CreateProduct(ProductModel product);
  Future<void> DeleteProduct(int id);
  Future<ProductModel> UpdateProduct(ProductModel product);
  Future<ProductModel> GetProduct(ProductModel product);
  Future<List<ProductModel>> GetAllProduct();
  
}