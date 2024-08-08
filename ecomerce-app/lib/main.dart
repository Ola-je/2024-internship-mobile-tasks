import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'models/product_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProductProvider(),
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
