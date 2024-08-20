import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/product/domain/entities/products.dart';
import '../features/product/presentation/bloc/product_bloc.dart';
import 'home_page.dart';

class DetailsPage extends StatefulWidget {
  final Products product;
  final int productIndex;

  const DetailsPage({
    Key? key,
    required this.product,
    required this.productIndex,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  // late TextEditingController _ratingController;
  // late TextEditingController _categoryController;
  late TextEditingController _descriptionController;

  int? _selectedSize;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _priceController = TextEditingController(text: widget.product.price.toString());
    // _ratingController = TextEditingController(text: widget.product.rating.toString());
    // _categoryController = TextEditingController(text: widget.product.category);
    _descriptionController = TextEditingController(text: widget.product.description);
    // _selectedSize = widget.product.size;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    // _ratingController.dispose();
    // _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> availableSizes = List.generate(8, (index) => 39 + index);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      widget.product.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xFF3F51F3)),
                      onPressed: ()=> Navigator.of(context).pop(),),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Text('Shoe',
                          
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 182, 181, 181),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 248, 224, 11),
                      ),
                      SizedBox(width: 3),
                      Text('('),
                      SizedBox(
                        width: 25,
                        child: Text(
                          '4.0',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 182, 181, 181),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(')')
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _nameController,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            fontFamily: 'Poppins'
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text('\$'),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Size:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: availableSizes.map((size) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedSize = size;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        foregroundColor: _selectedSize == size ? Colors.white : Colors.black,
                        backgroundColor: _selectedSize == size ? Color(0xFF3F51F3) : Colors.white,
                      ),
                      child: Text(size.toString()),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _descriptionController,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: null,
                minLines: 3,
              ),
            ),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                } 
                else if (state is LoadedSingleProductState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product updated successfully')));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ProductBloc>(context).add(DeleteProductEvent((widget.product.id)));
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HomePage()));
                        },
                        child: const Text('DELETE'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.red),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          final updatedProduct = Products(
                            id: widget.product.id,
                            name: _nameController.text,
                            description: _descriptionController.text,
                            price: double.parse(_priceController.text),
                            imagePath: widget.product.imagePath,
                          );
                          BlocProvider.of<ProductBloc>(context).add(UpdateProductEvent(updatedProduct));
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HomePage()));
                        },
                        child: const Text('UPDATE'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF3F51F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
