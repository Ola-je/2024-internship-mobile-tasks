import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Product')),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 250,
              width: 500,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromARGB(255, 230, 224, 224)),
            ),
            const Icon(
              Icons.image,
              size: 50,
              color: Color.fromARGB(255, 172, 170, 170),
            ),
            const Positioned(bottom: 80, child: Text('Upload Image'))
          ]),
          Container(
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 223, 218, 218),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 223, 218, 218),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 223, 218, 218),
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.attach_money)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 223, 218, 218),
            child: const TextField(
              maxLines: 10,
              minLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
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
                onPressed: () {},
                child: Text('ADD'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 22, 62, 172),
                    padding: EdgeInsets.symmetric(vertical: 16)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text('DELETE'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.red),
                    padding: EdgeInsets.symmetric(vertical: 16)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
