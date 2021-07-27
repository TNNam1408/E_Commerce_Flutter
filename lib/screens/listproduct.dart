import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String name;
  ListProduct({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Product",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          //
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey[500],
                  height: 500,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6,
                    scrollDirection: Axis.vertical,
                    children: [
                      SingleProduct(
                        image: "sx1.jpg",
                        price: 30.0,
                        name: "Ducati Motor Bike",
                      ),
                      SingleProduct(
                        image: "sx3.jpg",
                        price: 100.0,
                        name: "Civic and Ducati",
                      ),
                      SingleProduct(
                        image: "sx4.jpg",
                        price: 40.0,
                        name: "Ducati Motor  & BMW",
                      ),
                      SingleProduct(
                        image: "sx5.jpg",
                        price: 50.0,
                        name: "Ducati Race",
                      ),
                      SingleProduct(
                        image: "sx6.jpg",
                        price: 35.0,
                        name: "BMW S1000RR Race",
                      ),
                      SingleProduct(
                        image: "sx7.jpg",
                        price: 70.0,
                        name: "Ducati Panigale Race",
                      ),
                      SingleProduct(
                        image: "sx1.jpg",
                        price: 20.0,
                        name: "Ducati Panigale Race 2",
                      ),
                      SingleProduct(
                        image: "sx3.jpg",
                        price: 1020.0,
                        name: "Civic and Ducati",
                      ),
                      SingleProduct(
                        image: "sx5.jpg",
                        price: 370.0,
                        name: "Ducati Motor Bike",
                      ),
                      SingleProduct(
                        image: "sx6.jpg",
                        price: 99.0,
                        name: "BMW",
                      ),
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
