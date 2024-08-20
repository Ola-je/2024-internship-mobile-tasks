import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';

import '../../domain/usecase/delete_product.dart';
import '../models/product_model.dart';
import 'remote_data_sources.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourcesImplementation implements RemoteDataSources{
  final http.Client client;
  final String baseUrl;
  
  RemoteDataSourcesImplementation({required this.client, required this.baseUrl});

  @override
  Future<ProductModel> CreateProduct(ProductModel product) async{
    final uri = Uri.parse('$baseUrl/products');
    var request = http.MultipartRequest('POST', uri);

    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();
    
    var imageFile = File(product.imagePath);
    // print("kk");
    // print(product.imagePath);
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path,contentType: MediaType('image','png')));
    // print(request.fields);

    final streamedresponse = await client.send(request);
    final response = await http.Response.fromStream(streamedresponse);

    if (response.statusCode == 201){
      final responseBody = jsonDecode(response.body)['data'];
      return ProductModel.fromJson(responseBody);
    }
    else{
      // print(response.body);

      throw Exception('Failed to create product');
    }

  }


//   



  @override
  Future<ProductModel> GetProduct(ProductModel product) async {
    final uri = Uri.parse('$baseUrl/products/${product.id}');

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      return ProductModel.fromJson(responseBody);
    } else {
      throw Exception('Failed to fetch products: ${response.reasonPhrase}');
    }
  }

  @override
  Future<ProductModel> UpdateProduct(ProductModel product) async {
    final uri = Uri.parse('$baseUrl/products/${product.id}');
    
    final response = await client.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': product.id,
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'imagePath': product.imagePath,
      }),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)['data'];
      return ProductModel.fromJson(responseBody);
    } else {
      throw Exception('Failed to update product: ${response.reasonPhrase}');
    }
  }
  
  @override
  Future<void> DeleteProduct(String id) async {
    final uri = Uri.parse('$baseUrl/products/$id');

    final response = await client.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product: ${response.reasonPhrase}. Response body: ${response.body}');
    }
  }


  @override
  Future<List<ProductModel>> GetAllProduct() async{
    try {
      final uri = Uri.parse('$baseUrl/products');

    final response = await client.get(uri);

    if (response.statusCode == 200){
      final responseBody = jsonDecode(response.body)["data"];
      List<ProductModel> products = [];
      for (var i = 0; i < responseBody.length; i++){
        products.add(ProductModel.fromJson(responseBody[i]));
      }
      return products;
    }
    else{
      throw Exception('Failed to fetch products: ${response.reasonPhrase}');
    }} catch(e){
      throw Exception(e.toString());
    }
  }
  
}