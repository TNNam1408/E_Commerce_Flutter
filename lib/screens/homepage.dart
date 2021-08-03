import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/detailscreen.dart';
import 'package:e_commerce/screens/listproduct.dart';
import 'package:e_commerce/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../model/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Product hondaData;
Product suzukiData;


// Product bmwData;
// Product yamahaData;
// Product ducatiData;
// Product kawashakiData;

Product cbr650rData;
Product r6Data;

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


  var topProductSnapShot;
  var newAchiveSnapShot;


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
  ////////////////////

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "TN Nam",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(color: Colors.grey[300]),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/yamahar1.jpg"),
            ),
            accountEmail: Text(
              "TNNam1408@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contantUsColor = false;
                aboutColor = false;
                cartColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              setState(() {
                cartColor = true;
                contantUsColor = false;
                aboutColor = false;
                homeColor = false;
              });
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contantUsColor = false;
                cartColor = false;
                homeColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: contantUsColor,
            onTap: () {
              setState(() {
                contantUsColor = true;
                aboutColor = false;
                cartColor = false;
                homeColor = false;
              });
            },
            leading: Icon(Icons.phone),
            title: Text("Contant Us"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlide() {
    return Container(
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
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
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
              _buildCategoryProduct(image: "moto.png", color: 0xFF393939),
              _buildCategoryProduct(image: "motor.png", color: 0xFF393939),
              _buildCategoryProduct(image: "oto.png", color: 0xFF393939),
              _buildCategoryProduct(image: "bicycle.png", color: 0xFF393939),
              _buildCategoryProduct(image: "set.png", color: 0xFF393939),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopProduct() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Products",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                          name: "Top Products",
                          snapShot: topProductSnapShot,
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      name: hondaData.name,
                      price: hondaData.price,
                      image: hondaData.image,
                        )));
              },
              child: SingleProduct(
                name: hondaData.name,
                price: hondaData.price,
                image: hondaData.image,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                          name: suzukiData.name,
                          price: suzukiData.price,
                          image: suzukiData.image,
                        )));
              },
              child: SingleProduct(
                name:suzukiData.name,
                price: suzukiData.price,
                image: suzukiData.image,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewAchives() {
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
                    "New Achives",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                                name: "New Achives",
                            snapShot: newAchiveSnapShot,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              name: cbr650rData.name,
                              price: cbr650rData.price,
                              image: cbr650rData.image,
                                )));
                      },
                      child: SingleProduct(
                        name: cbr650rData.name,
                        price: cbr650rData.price,
                        image: cbr650rData.image,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                                  name: r6Data.name,
                                  price: r6Data.price,
                                  image: r6Data.image,
                                )));
                      },
                      child: SingleProduct(
                        name: r6Data.name,
                        price: r6Data.price,
                        image: r6Data.image,
                      ),
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
      drawer: _buildMyDrawer(),
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
      body: FutureBuilder(
          future: Firestore.instance
              .collection("products")
              .document("NmosClmieY6PfadcS9Nl")
              .collection("topproducts")
              .getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            topProductSnapShot = snapshot;
            hondaData = Product(
                image: snapshot.data.documents[0]["image"],
                name: snapshot.data.documents[0]["name"],
                price: snapshot.data.documents[0]["price"]);
            print(hondaData);

            suzukiData = Product(
                image: snapshot.data.documents[4]["image"],
                name: snapshot.data.documents[4]["name"],
                price: snapshot.data.documents[4]["price"]);
            print(suzukiData);

            return FutureBuilder(
              future: Firestore.instance
                  .collection("products")
                  .document("NmosClmieY6PfadcS9Nl")
                  .collection("newachives")
                  .getDocuments(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                newAchiveSnapShot = snapShot;
                cbr650rData = Product(
                    image: snapShot.data.documents[1]["image"],
                    name: snapShot.data.documents[1]["name"],
                    price: snapShot.data.documents[1]["price"]);
                print(cbr650rData);

                r6Data = Product(
                    image: snapShot.data.documents[4]["image"],
                    name: snapShot.data.documents[4]["name"],
                    price: snapShot.data.documents[4]["price"]);
                print(r6Data);


                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey[200],
                  child: ListView(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildImageSlide(),
                            _buildCategory(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildTopProduct(),
                            _buildNewAchives(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          }),
    );
  }
}
