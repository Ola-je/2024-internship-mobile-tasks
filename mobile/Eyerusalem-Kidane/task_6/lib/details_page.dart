import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Size:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('39'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('40'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('41'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 22, 62, 172),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('42'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('43'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('44'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('45'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('46'),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))))),
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                  style: TextStyle(fontSize: 14),
                  softWrap: true,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('DELETE'),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.red))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('UPDATE'),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 22, 62, 172),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
