import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final snapShot;
  ListProduct({this.name, this.snapShot});
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
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
                  child: GridView.builder(

                    itemCount: snapShot.data.documents.length,
                    itemBuilder: (ctx, index) => SingleProduct(
                      name: snapShot.data.documents[index]["name"],
                      price: snapShot.data.documents[index]["price"],
                      image: snapShot.data.documents[index]["image"],
                    ),

                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
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
