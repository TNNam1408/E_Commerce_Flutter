import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {

  Widget _buildFeaturedProduct({String name, double price, String image}){
    return Card(
      child: Container(
        height: 240,
        width: 160,
        //color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/$image")),
              ),
            ),
            Text("\$ $price",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xff9b96d6)),),
            Text(name,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),)
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProduct({String image, int color}){
    return CircleAvatar(
      maxRadius: 34,
      backgroundColor: Color(color),
      // backgroundColor: Colors.grey[700],
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }

  Widget _buildButhFeaOrNewProduct(){
    return Column(
      children: [
        Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
                  Text("See All",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),

        //View moto and car
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    _buildFeaturedProduct(
                      image: "sx1.jpg",
                      price: 30.0,
                      name: "Ducati Motor Bike",
                    ),
                    _buildFeaturedProduct(
                      image: "sx3.jpg",
                      price: 100.0,
                      name: "Civic and Ducati",
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("HomePage",
          style: TextStyle(color: Colors.black),),
        centerTitle:  true,
        elevation:  0.0,
        backgroundColor: Colors.grey[400],
        leading: IconButton(onPressed: (){
          _scaffoldKey.currentState.openDrawer();
        },
            icon: Icon(Icons.menu, color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: Colors.black)),
          IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Colors.black)),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.grey[200],
        child: ListView(
          children: [
            Column(
              children: [
                //Container search and feature and see all
                Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search Somethink",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Featured",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
                                Text("See All",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ////////////////
                    ],
                  ),
                ),

                //View moto and car
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            _buildFeaturedProduct(
                              image: "sx1.jpg",
                              price: 30.0,
                              name: "Ducati Motor Bike",
                            ),
                            _buildFeaturedProduct(
                              image: "sx3.jpg",
                              price: 100.0,
                              name: "Civic and Ducati",
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                //Categorie
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categorie",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
                      Text("See All",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                //Icon the loai
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryProduct(image: "moto.png",color: 0xFF393939),
                      _buildCategoryProduct(image:"motor.png", color: 0xFF393939),
                      _buildCategoryProduct(image:"oto.png", color: 0xFF393939),
                      _buildCategoryProduct(image:"bicycle.png", color: 0xFF393939),
                      _buildCategoryProduct(image:"set.png", color: 0xFF393939),
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Achives",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
                          Text("See All",style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            _buildFeaturedProduct(
                              image: "sx4.jpg",
                              price: 40.0,
                              name: "Ducati Interface",
                            ),
                            _buildFeaturedProduct(
                              image: "sx5.jpg",
                              price: 1000.0,
                              name: "Ducati Racing",
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

