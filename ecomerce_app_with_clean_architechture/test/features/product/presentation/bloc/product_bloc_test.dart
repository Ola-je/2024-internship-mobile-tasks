import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:task_6/core/util/input_converter.dart';
import 'package:task_6/features/product/domain/usecase/add_product.dart';
import 'package:task_6/features/product/domain/usecase/delete_product.dart';
import 'package:task_6/features/product/domain/usecase/get_product.dart';
import 'package:task_6/features/product/domain/usecase/update_product.dart';
import 'package:task_6/features/product/presentation/bloc/product_bloc.dart';

class MockAddProduct extends Mock implements AddProduct {}
class MockGetProduct extends Mock implements GetProduct {}
class MockDeleteProduct extends Mock implements DeleteProduct {}
class MockUpdateProduct extends Mock implements UpdateProduct {}
// class MockProductBloc extends Mock implements ProductBloc {}
class MockInputConverter extends Mock implements InputConverter {}


void main(){
  late ProductBloc bloc;
  late MockAddProduct mockAddProduct;
  late MockGetProduct mockGetProduct;
  late MockDeleteProduct mockDeleteProduct;
  late MockUpdateProduct mockUpdateProduct;
  late MockInputConverter mockInputConverter;

  setUp((){
    mockAddProduct = MockAddProduct();
    mockGetProduct = MockGetProduct();
    mockDeleteProduct = MockDeleteProduct();
    mockUpdateProduct = MockUpdateProduct();
    mockInputConverter = MockInputConverter();

    bloc = ProductBloc(
      // initialState: InitialState(),
      addProduct: mockAddProduct,
      getProduct: mockGetProduct,
      deleteProduct: mockDeleteProduct,
      updateProduct: mockUpdateProduct,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', (){
    // assert
    expect(bloc.state, equals(InitialState()));
  });

  // group('AddProduct', (){
  //   final tProduct = Product(id: 1, name: 'Product 1', price: 1000, stock: 10);

  //   test('should call the InputConverter to validate and convert the string to an unsigned integer', () async {
  //     // arrange
  //     when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Right(1));
  //     // act
  //     bloc.add(AddProductEvent(tProduct));
  //     await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
  //     // assert
  //     verify(mockInputConverter.stringToUnsignedInteger(tProduct.id.toString()));
  //   });

//     test('should emit [Error] when the input is invalid', () async {
//       // arrange
//       when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Left(InvalidInputFailure()));
//       // assert later
//       final expected = [
//         ErrorState(message: INVALID_INPUT_FAILURE_MESSAGE)
//       ];
//       expectLater(bloc.stream, emitsInOrder(expected));
//       // act
//       bloc.add(AddProductEvent(tProduct));
//     });

//     test('should get data from the addProduct use case', () async {
//       // arrange
//       when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Right(1));
//       when(mockAddProduct(any)).thenAnswer((_) async => Right(tProduct));
//       // act
//       bloc.add(AddProductEvent(tProduct));
//       await untilCalled(mockAddProduct(any));
//       // assert
//       verify(mockAddProduct(Params(product: tProduct)));
//     });

//     test('should emit [Loading
// }
  }