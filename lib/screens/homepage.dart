import 'package:e_commerce/screens/listproduct.dart';
import 'package:e_commerce/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct({String image, int color}) {
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

  bool homeColor = true;

  bool cartColor = false;

  bool aboutColor = false;

  bool contantUsColor = false;

  // bool logoutColor = true;

////////////
  Widget _buildButhFeaOrNewProduct() {
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
                  Text(
                    "Featured",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("See All",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
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
                    SingleProduct(
                      name: "Ducati Motor Bikec",
                      price: 30.0,
                      image: "sx1.jpg",
                    ),
                    SingleProduct(
                      name: "Civic and Ducati",
                      price: 100.0,
                      image: "sx3.jpg",
                    ),
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("TN Nam",style: TextStyle(color: Colors.black),),
                decoration: BoxDecoration(color: Colors.grey[300]),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/yamahar1.jpg"),
                ),
                accountEmail: Text("TNNam1408@gmail.com",style: TextStyle(color: Colors.black),),
            ),
            ListTile(
              selected: homeColor,
              onTap: (){
                setState(() {
                  homeColor = true;
                  contantUsColor = false;
                  aboutColor = false;
                  cartColor = false;
                });
              },
              leading:  Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: cartColor,
              onTap: (){
                setState(() {
                  cartColor = true;
                  contantUsColor = false;
                  aboutColor = false;
                  homeColor = false;
                });
              },
              leading:  Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            ListTile(
              selected: aboutColor,
              onTap: (){
                setState(() {
                  aboutColor = true;
                  contantUsColor = false;
                  cartColor = false;
                  homeColor = false;
                });
              },
              leading:  Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              selected: contantUsColor,
              onTap: (){
                setState(() {
                  contantUsColor = true;
                  aboutColor = false;
                  cartColor = false;
                  homeColor = false;
                });
              },
              leading:  Icon(Icons.phone),
              title: Text("Contant Us"),
            ),
            ListTile(
              onTap: (){},
              leading:  Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[400],
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: Colors.black)),
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
                // Container(
                //   height: 120,
                //   width: double.infinity,
                //   color: Colors.grey[300],
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //     ],
                //   ),
                // ),

                //View moto and car
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 240,
                          child: Carousel(
                            autoplay: true,
                            showIndicator: false,
                            images: [
                              AssetImage("images/sx1.jpg"),
                              AssetImage("images/sx3.jpg"),
                              AssetImage("images/sx4.jpg"),
                              AssetImage("images/sx5.jpg"),
                              AssetImage("images/sx6.jpg"),
                              AssetImage("images/sx7.jpg"),
                            ],
                          ),
                        ),
                        //Categorie
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Categorie",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),

                        //Icon the loai
                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildCategoryProduct(
                                  image: "moto.png", color: 0xFF393939),
                              _buildCategoryProduct(
                                  image: "motor.png", color: 0xFF393939),
                              _buildCategoryProduct(
                                  image: "oto.png", color: 0xFF393939),
                              _buildCategoryProduct(
                                  image: "bicycle.png", color: 0xFF393939),
                              _buildCategoryProduct(
                                  image: "set.png", color: 0xFF393939),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => ListProduct(
                                          name: "Featured",
                                        )));
                              },
                              child: Text("View more",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleProduct(
                              name: "Ducati Motor Bikec",
                              price: 30.0,
                              image: "sx1.jpg",
                            ),
                            SingleProduct(
                              name: "Civic and Ducati",
                              price: 100.0,
                              image: "sx3.jpg",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Achives",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => ListProduct(
                                        name: "New Achives",
                                      )));
                            },
                            child: Text("View more",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
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
                            SingleProduct(
                              name: "Ducati Interface",
                              price: 40.0,
                              image: "sx4.jpg",
                            ),
                            SingleProduct(
                              name: "Ducati Racing",
                              price: 1000.0,
                              image: "sx5.jpg",
                            ),
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
