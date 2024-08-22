import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/features/product/domain/usecase/get_product.dart';
import 'package:task_6/features/product/presentation/bloc/product_bloc.dart';
import 'core/util/input_converter.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_up.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/splash.dart';
import 'features/injection_container.dart';
import 'features/product/domain/usecase/add_product.dart';
import 'features/product/domain/usecase/delete_product.dart';
import 'features/product/domain/usecase/get_all_product.dart';
import 'features/product/domain/usecase/update_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            addProduct: locator<AddProduct>(),
            getProduct: locator<GetProduct>(),
            getAllProduct: locator<GetAllProduct>(),
            deleteProduct: locator<DeleteProduct>(),
            updateProduct: locator<UpdateProduct>(),
            inputConverter: locator<InputConverter>(),
          )..add(LoadAllProductEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            signUp: locator<SignUp>(), 
            signIn: locator<SignIn>()
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
