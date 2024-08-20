import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../core/util/input_converter.dart';
import '../features/injection_container.dart';
import '../features/product/domain/usecase/add_product.dart';
import '../features/product/domain/usecase/delete_product.dart';
import '../features/product/domain/usecase/get_all_product.dart';
import '../features/product/domain/usecase/get_product.dart';
import '../features/product/domain/usecase/update_product.dart';
import '../features/product/presentation/bloc/product_bloc.dart';
import '/views/search_page.dart';
import '/views/add_product_page.dart';
import '../models/cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: const Icon(
              Icons.add_circle_sharp,
              size: 50,
              color: Color(0xFF3F51F3),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddProductPage(),
                ),
              );
            },
          ),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.square_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 228, 227, 227),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DateDisplay(),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello, ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Sora',
                                ),
                              ),
                              TextSpan(
                                text: 'Yohannes',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Sora',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Color.fromARGB(255, 146, 146, 143),
                    ),
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3F51F3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Available Products',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      GestureDetector(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color.fromARGB(255, 241, 239, 239),
                                  width: 3,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.search,
                              size: 30,
                              color: Color.fromARGB(255, 231, 228, 228),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const SearchPage(),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LoadedAllProductState) {
                        return Column(
                          children: List.generate(
                            state.products.length,
                            (index) => Cards(
                              product: state.products[index],
                              index: index,
                            ),
                          ),
                        );
                      } else if (state is ErrorState) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return const Center(
                        child: Text('No products available.'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM d, yyyy').format(now);

    return Text(
      formattedDate,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Syne',
      ),
    );
  }
}
