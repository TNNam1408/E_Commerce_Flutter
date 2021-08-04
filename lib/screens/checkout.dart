import 'package:e_commerce/screens/cartscreen.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  final double price;
  final String name;
  final String image;

  Checkout({this.price, this.name, this.image});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextStyle myStyle = TextStyle(fontSize: 20, color: Colors.black);

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
                        image: NetworkImage(widget.image),

                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 140,
                  width: 180,
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
                          "Performance",
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
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Quentity"),
                              Text("1"),
                            ],
                          ),
                        ),
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

  Widget _buildBottonDetail({String startName, String endName}){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CheckOut Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        // leading: IconButton(
        //   onPressed: () {
        //     // Navigator.of(context).pushReplacement(
        //     //     MaterialPageRoute(builder: (ctx) => CartScreen()));
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (ctx) => HomePage()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        iconTheme: IconThemeData(
            color: Colors.black
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
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Color(0xff746bc9),
          child: Text("Buy", style: TextStyle(color: Colors.white, fontSize: 20),),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottonDetail(startName: "Your Price", endName: "\$ 60.00"),
                      _buildBottonDetail(startName: "Discount", endName: "3%"),
                      _buildBottonDetail(startName: "Shipping", endName: "\$ 60.00"),
                      _buildBottonDetail(startName: "Total", endName: "\$ 90"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
