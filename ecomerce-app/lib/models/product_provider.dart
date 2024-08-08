import 'package:flutter/material.dart';
import 'product.dart';

class ProductProvider extends ChangeNotifier{
  final List<Product> _products =[
    Product(name: 'Derby Leather shoes', price: 120.0, rating: 4.0, category: 'Men\'s Shoe', size: 41, description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.', imageUrl: "image/shoes.png"),
  ];
  List <Product> get products => _products;

  void addProduct(Product product){
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(int index, Product product){
    _products[index]=product;
    notifyListeners();
  }

  void deleteProduct(int index){
    _products.removeAt(index);
    notifyListeners();
  }

  Product getProduct(int index){
    return _products[index];
  }

}