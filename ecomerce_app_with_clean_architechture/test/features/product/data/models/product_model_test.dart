import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/domain/entities/products.dart';

import '../../helpers/reader_json.dart';

void main(){
  const testProductModel =ProductModel(
    id: 1,
    name: 'shoe',
    description: 'a good shoe', 
    price: 700,  
    imagePath: 'imagePath');


  test('This should be a sub class of products entity', ()async{
    expect(testProductModel, isA<Products>());
  });

  test('This should return a valid model from Json', ()async{
    final Map<String, dynamic> jsonMap = json.decode(readJson('dummy_product_response.json'),
    );

    final result = ProductModel.fromJson(jsonMap);

    expect(result, equals(testProductModel));
  });

  test('This should return a valid model to Json', ()async{
    
    final result = testProductModel.toJson();
    final expectedJsonMap = {
      'id': 1,
      'name': 'shoe',
      'description': 'a good shoe',
      'price': 700,
      'imagePath': 'imagePath'
    };

    expect(result, equals(expectedJsonMap));
  });

}