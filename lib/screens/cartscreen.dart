
import 'package:e_commerce/screens/checkout.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class CartScreen extends StatefulWidget {
  final double price;
  final String name;
  final String image;

  CartScreen({this.price, this.name, this.image});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;

  final TextStyle myStyle = TextStyle(fontSize: 20, color: Colors.white);

  Widget _buildSingleCartProduct() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/${widget.image}"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "4 cylinders in line ",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$ ${widget.price.toString()} ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff9b96d6),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: 120,
                          // decoration: BoxDecoration(
                          //   color: Colors.grey[300],
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          color: Color(0xfff2f2f2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    }
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   height: 38,
                        //   width: double.infinity,
                        //   // ignore: deprecated_member_use
                        //   child: RaisedButton(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(20)),
                        //     color: Colors.pink,
                        //     child: Text(
                        //       "Check Out",
                        //       style:  TextStyle(
                        //             fontSize: 18,
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold),
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Color(0xff746bc9),
            child: Text("Comtinous", style: myStyle,),
            onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Checkout(
              image: widget.image,
              name: widget.name,
              price: widget.price,
            )));
            },
            ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (ctx) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
        ],
      ),
    );
  }
}
