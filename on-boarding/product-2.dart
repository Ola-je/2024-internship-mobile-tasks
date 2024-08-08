import 'dart:io';

void main() {
  ProductManager manager = ProductManager();
  while (true) {
    print('Menu:');
    print(
        '\n 1: Add a new product \n 2: View all products \n 3: View a single product \n 4: Edit a product \n 5: Delete a product \n 6: Exit');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        manager.addProduct();
        break;
      case '2':
        manager.viewAll();
        break;
      case '3':
        manager.viewOne();
        break;
      case '4':
        manager.edit();
        break;
      case '5':
        manager.delete();
        break;
      case '6':
        exit(0);
      default:
        print('Invalid choice.');
    }
  }
}

class Product {
  String? name, description;
  int? price;

  Product(this.name, this.description, this.price);

  @override
  String toString() {
    return 'Product{name: $name, description: $description, price: $price}';
  }
}

class ProductManager {
  List<Product> products = [];

  void addProduct() {
    stdout.write('Enter product name: ');
    String? name = stdin.readLineSync()?.trim();

    stdout.write('Enter product description: ');
    String? description = stdin.readLineSync()?.trim();
    
    stdout.write('Enter product price: ');
    String? priceInput = stdin.readLineSync();
    int? price = int.tryParse(priceInput ?? '');

    if ((name != null && name.isNotEmpty) && (description != null && description.isNotEmpty) && price != null) {
      Product newProduct = Product(name, description, price);
      products.add(newProduct);
      print('$newProduct successfully added!');
    } else {  
      print('Invalid input.');
    }
  }

  void viewAll() {
    if (products.isEmpty) {
      print('No records found.');
    } else {
      for (var product in products) {
        print(product);
      }
    }
  }

  void viewOne() {
    stdout.write('Enter name of product you want to see: ');
    String? name = stdin.readLineSync();

    if (name != null) {
      Product? temp;
      for (var product in products) {
        if (product.name == name) {
          temp = product;
          break;
        }
      }

      if (temp == null) {
        print('Item not found!');
      } else {
        print(temp);
      }
    } else {
      print('Invalid input.');
    }
  }

  void edit() {
    stdout.write('Enter name of product to be edited: ');
    String? editedName = stdin.readLineSync();
    stdout.write('Enter new name of product: ');
    String? name = stdin.readLineSync();
    stdout.write('Enter new description of product: ');
    String? description = stdin.readLineSync();
    stdout.write('Enter new price of product: ');
    String? priceInput = stdin.readLineSync();
    int? price = int.tryParse(priceInput ?? '');

    if (editedName != null && name != null && description != null && price != null) {
      for (int i = 0; i < products.length; i++) {
        if (products[i].name == editedName) {
          products[i] = Product(name, description, price);
          print('Edited item: ${products[i]}');
          return;
        }
      }
      print('Item not found.');
    } else {
      print('Invalid input.');
    }
  }

  void delete() {
    stdout.write('Enter name of product you want to delete: ');
    String? name = stdin.readLineSync();

    if (name != null) {
      bool found = false;
      for (int i = 0; i < products.length; i++) {
        if (products[i].name == name) {
          products.removeAt(i);
          found = true;
          print('Product deleted successfully!');
          break;
        }
      }
      if (!found) {
        print('Item not found.');
      }
    } else {
      print('Invalid input.');
    }
  }
}
