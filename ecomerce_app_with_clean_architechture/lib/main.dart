import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/features/product/domain/usecase/get_product.dart';
import 'package:task_6/features/product/presentation/bloc/product_bloc.dart';
import 'core/util/input_converter.dart';
import 'features/injection_container.dart';
import 'features/product/domain/usecase/add_product.dart';
import 'features/product/domain/usecase/delete_product.dart';
import 'features/product/domain/usecase/get_all_product.dart';
import 'features/product/domain/usecase/update_product.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => ProductBloc(
        addProduct: locator<AddProduct>(),
        getProduct: locator<GetProduct>(),
        getAllProduct: locator<GetAllProduct>(),
        deleteProduct: locator<DeleteProduct>(),
        updateProduct: locator<UpdateProduct>(),
        inputConverter: locator<InputConverter>(),
      )..add(LoadAllProductEvent()) ,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
