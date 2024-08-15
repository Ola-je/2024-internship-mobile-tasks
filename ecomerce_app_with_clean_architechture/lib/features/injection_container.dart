import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/network_info_implementation.dart';
import '../core/util/input_converter.dart';
import 'product/data/data_sources/local_data_sources.dart';
import 'product/data/data_sources/local_data_sources_implementation.dart';
import 'product/data/data_sources/remote_data_sources.dart';
import 'product/data/data_sources/remote_data_sources_implementation.dart';
import 'product/data/repository/product_repository_implementation.dart';
import 'product/domain/repositories/product_repository.dart';
import 'product/domain/usecase/add_product.dart';
import 'product/domain/usecase/delete_product.dart';
import 'product/domain/usecase/get_all_product.dart';
import 'product/domain/usecase/get_product.dart';
import 'product/domain/usecase/update_product.dart';
import 'product/presentation/bloc/product_bloc.dart';


final locator = GetIt.instance;
Future<void> setUp() async{

  locator.registerLazySingleton(()=>http.Client());
  locator.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImplementation(locator()));
  locator.registerLazySingleton(()=>InputConverter());
  locator.registerLazySingleton(()=>InternetConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerLazySingleton<RemoteDataSources>(()=> RemoteDataSourcesImplementation(client: locator(), baseUrl: locator()));
  locator.registerLazySingleton<LocalDataSources>(() => LocalDataSourcesImplementation());

  locator.registerLazySingleton<ProductRepository>(()=> ProductRepositoryImplementation(remoteDataSources: locator(), localDataSources: locator(), networkInfo: locator()));

  locator.registerLazySingleton(() => GetAllProduct(locator()));
  locator.registerLazySingleton(() => GetProduct(locator()));
  locator.registerLazySingleton(() => AddProduct(locator()));
  locator.registerLazySingleton(() => UpdateProduct(locator()));
  locator.registerLazySingleton(() => DeleteProduct(locator()));

  locator.registerFactory(() => ProductBloc(
    addProduct: locator(), 
    getProduct: locator(), 
    getAllProduct: locator(), 
    deleteProduct: locator(), 
    updateProduct: locator(), 
    inputConverter: locator()));

}