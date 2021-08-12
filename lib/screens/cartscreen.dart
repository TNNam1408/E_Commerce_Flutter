import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/widgets/cartsingleproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class CartScreen extends StatefulWidget {
  // final String image;
  // final String name;
  // final double price;
  // final int quentity;
  //
  // CartScreen({this.image, this.name, this.price, this.quentity});
  @override
  _CartScreenState createState() => _CartScreenState();
}
ProductProvider productProvider;
class _CartScreenState extends State<CartScreen> {
  final TextStyle myStyle = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Color(0xff746bc9),
          child: Text(
            "Comtinous",
            style: myStyle,
          ),
          onPressed: () {

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
        // leading: IconButton(
        //   onPressed: () {
        //     // Navigator.of(context).pushReplacement(
        //     //     MaterialPageRoute(builder: (ctx) => DetailScreen()));
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (ctx) => HomePage()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),

        iconTheme: IconThemeData(color: Colors.black),

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
      body: ListView.builder(
        itemCount:  productProvider.getCartModelListLength,
        itemBuilder: (ctx, index) => CartSingleProduct(
          image:  productProvider.getCartModelList[index].image,
          name:  productProvider.getCartModelList[index].name,
          price:  productProvider.getCartModelList[index].price,
          quentity:  productProvider.getCartModelList[index].quentity,
        ),
      ),
    );
  }
}
