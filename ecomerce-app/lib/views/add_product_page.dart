import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_6/models/product_provider.dart';
import 'dart:io';
import '../models/product.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Take a photo'),
            onTap: () => Navigator.pop(context, ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Choose from gallery'),
            onTap: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ],
      ),
    );

    if (source != null) {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    }
  }

  void _resetFields() {
    _nameController.clear();
    _categoryController.clear();
    _priceController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedImage = null;
    });
  }

  void _addProduct() {
    final String name = _nameController.text;
    final String category = _categoryController.text;
    final double price = double.tryParse(_priceController.text) ?? 0.0;
    final String description = _descriptionController.text;
    final double rating = 4.0;
    final int size = 41;

    if (name.isNotEmpty &&
        category.isNotEmpty &&
        description.isNotEmpty &&
        _selectedImage != null) {
      Product newProduct = Product(
        name: name,
        price: price,
        rating: rating,
        category: category,
        size: size,
        description: description,
        imageUrl: _selectedImage!.path,
      );

      final productList = Provider.of<ProductProvider>(context, listen: false);
      productList.addProduct(newProduct);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Product', 
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500),)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color(0xFFF3F3F3),
                  ),
                  child: _selectedImage != null
                      ? Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.image,
                          size: 50,
                          color: Color(0xFFF3F3F3),
                        ),
                ),
              ),
              Positioned(bottom: 80, child: Text('Upload Image', style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),))
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            color:Color(0xFFF3F3F3),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color:Color(0xFFF3F3F3),
            child: TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
                labelStyle: TextStyle(fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Color(0xFFF3F3F3),
            child: TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.attach_money),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Color(0xFFF3F3F3),
            child: TextField(
              controller: _descriptionController,
              maxLines: 10,
              minLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _addProduct,
                child: Text('ADD'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF3F51F3),
                  minimumSize: Size.square(57),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _resetFields,
                child: Text('DELETE'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  backgroundColor: Colors.white,
                  minimumSize: Size.square(57),
                  side: BorderSide(color: Colors.red),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}