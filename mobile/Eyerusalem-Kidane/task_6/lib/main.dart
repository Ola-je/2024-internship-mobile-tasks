import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_6/details_page.dart';
import 'search_page.dart';
import 'add_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Builder(builder: (context) {
          return Stack(
            children: [
              Positioned(
                bottom: 40,
                right: 10,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: const Icon(
                    Icons.add_circle_sharp,
                    size: 60,
                    color: Color.fromARGB(255, 22, 62, 172),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AddProductPage()),
                    );
                  },
                ),
              ),
            ],
          );
        }),
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
                  const SizedBox(width: 10), // Space between icon and title
                  // Title and other information
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateDisplay(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hello, ',
                              style: TextStyle(fontSize: 15),
                            ),
                            TextSpan(
                              text: 'Yohannes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
              // Trailing notification icon with badge
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
                        color: Color.fromARGB(255, 241, 239, 239),
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
                        color: Colors.blueAccent,
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()),
                          );
                        },
                      );
                    }),
                  ],
                ),
                Column(
                  children: List.generate(3, (index) => const Cards()),
                )
              ],
            ),
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
      style: const TextStyle(fontSize: 12),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset('image/shoes.png'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Derby Leather Shoes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$120',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Men\'s Shoe',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 182, 181, 181),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 248, 224, 11),
                      ),
                      Text(
                        '(4.0)',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 182, 181, 181),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailsPage(),
          ),
        );
      },
    );
  }
}
