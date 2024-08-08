class Product {
  final String name;
  final double price;
  final double rating;
  final String category;
  final int size;
  final String description;
  final String imageUrl;

  Product({required this.name, required this.price,required this.rating, required this.category, required this.size, required this.description, required this.imageUrl});

  get availableSizes => null;
}
