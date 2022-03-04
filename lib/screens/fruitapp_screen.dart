import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'counter.dart';
import 'image_carousel.dart';

class FruitApp extends StatefulWidget {
  const FruitApp({Key? key}) : super(key: key);

  @override
  State<FruitApp> createState() => _FruitAppState();
}

class _FruitAppState extends State<FruitApp> {
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 18, 51, 83),
          leading: Row(
            children: <Widget>[
              SizedBox(width: 8.0),
              IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 18, 51, 83),
        body: ListView(
          children: <Widget>[
            CarouselWithIndicatorDemo(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(50.0),
                  topRight: const Radius.circular(50),
                ),
              ),
              height: 500.0,
              width: 500.0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Mango',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('1 each'),
                      SizedBox(
                        height: 20.0,
                      ),
                      CounterDesign(),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Product Description',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'A mango is a type of fruit. '
                        'The mango tree is native to South Asia, '
                        'from where it has been taken to become one of the most widely cultivated fruits in the tropics.'
                        'It is harvested in the month of march (summer season) till the end of May.',
                        style: TextStyle(letterSpacing: 2.0, fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.black),
                            ),
                            height: 70.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    color: Color.fromARGB(255, 207, 40, 207)),
                                elevation: 2,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                              ),
                              child: IconButton(
                                icon: _isFavorited
                                    ? Icon(
                                        Icons.favorite_border,
                                        color:
                                            Color.fromARGB(255, 207, 40, 207),
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color:
                                            Color.fromARGB(255, 207, 40, 207),
                                      ),
                                onPressed: _toggleFavorite,
                              ),
                              onPressed: _toggleFavorite,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ButtonTheme(
                            child: ElevatedButton.icon(
                              label: Text('Add to cart'),
                              icon: const Icon(Icons.shopping_cart),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 18, 51, 83),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 18, 51, 83)),
                                elevation: 0,
                                textStyle: TextStyle(
                                  //fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
