import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/categoryicon.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/detailscreen.dart';
import 'package:e_commerce/screens/listproduct.dart';
import 'package:e_commerce/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CategoryProvider categoryProvider;
ProductProvider productProvider;

Product hondaData;
Product suzukiData;

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
          image: NetworkImage(image),
        ),
      ),
    );
  }
  //Category Icon
  Widget _BuildPreformanceIcon(){
    List<Product> performance = categoryProvider.getPerformanceList;
    List<CategoryIcon> performanceIcon = categoryProvider.getPerformanceIconList;
    return Row(
      children: performanceIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Performance",
                  snapShot: performance,
                )));
          },
          child: _buildCategoryProduct(
              image:e.image, color: 0xFF393939),
        );
      }).toList(),
    );
  }
  Widget _BuildMotorIconIcon(){
    List<Product> motor = categoryProvider.getMotorList;
    List<CategoryIcon> motorIcon = categoryProvider.getMotorIconList;
    return Row(
      children: motorIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Motor",
                  snapShot: motor,
                )));
          },
          child: _buildCategoryProduct(
              image:e.image, color: 0xFF393939),
        );
      }).toList(),
    );
  }
  Widget _BuildCarIconIcon(){
    List<Product> car = categoryProvider.getCarList;
    List<CategoryIcon> carIcon = categoryProvider.getCarIconList;
    return Row(
      children: carIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Car",
                  snapShot: car,
                )));
          },
          child: _buildCategoryProduct(
              image:e.image, color: 0xFF393939),
        );
      }).toList(),
    );
  }
  Widget _BuildBicycleIconIcon(){
    List<Product> bicycle = categoryProvider.getBicycleList;
    List<CategoryIcon> bicycleIcon = categoryProvider.getBicycleIconList;
    return Row(
      children: bicycleIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Bicycle",
                  snapShot: bicycle,
                )));
          },
          child: _buildCategoryProduct(
              image:e.image, color: 0xFF393939),
        );
      }).toList(),
    );
  }
  Widget _BuildLogisticsIconIcon(){
    List<Product> logistics = categoryProvider.getLogisticsList;
    List<CategoryIcon> logisticsIcon = categoryProvider.getLogisticsIconList;
    return Row(
      children: logisticsIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Logistics",
                  snapShot: logistics,
                )));
          },
          child: _buildCategoryProduct(
              image:e.image, color: 0xFF393939),
        );
      }).toList(),
    );
  }

  bool homeColor = true;

  bool cartColor = false;

  bool aboutColor = false;

  bool contantUsColor = false;

  // bool logoutColor = true;

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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (ctx) => ListProduct(
              //           name: "Performance",
              //           snapShot: performance,
              //         )));
              //   },
              //   child: _buildCategoryProduct(
              //       image:performanceIcon[0].image, color: 0xFF393939),
              // ),

              _BuildPreformanceIcon(),
              _BuildMotorIconIcon(),
              _BuildCarIconIcon(),
              _BuildBicycleIconIcon(),
              _BuildLogisticsIconIcon(),
            ],
          ),
        ),
      ],
    );
  }

  //bac bo cai provodr ra ngoai ham build di

  Widget _buildTopProduct() {
    List<Product> topproducts = productProvider.getTopProductsList;
    List<Product> hometopproduct = productProvider.getHomeTopProductList;

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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                          name: "Top Products",
                          snapShot: topproducts,
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
        // Row(
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (ctx) => DetailScreen(
        //                       name: topproducts.elementAt(0).name,
        //                       price: topproducts.elementAt(0).price,
        //                       image:topproducts.elementAt(0).image,
        //                     )));
        //               },
        //               child: SingleProduct(
        //                 name: topproducts.elementAt(0).name,
        //                 price: topproducts.elementAt(0).price,
        //                 image:topproducts.elementAt(0).image,
        //               ),
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (ctx) => DetailScreen(
        //                       name: topproducts.elementAt(1).name,
        //                       price: topproducts.elementAt(1).price,
        //                       image:topproducts.elementAt(1).image,
        //                     )));
        //               },
        //               child: SingleProduct(
        //                 name: topproducts.elementAt(1).name,
        //                 price: topproducts.elementAt(1).price,
        //                 image:topproducts.elementAt(1).image,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: hometopproduct.map((e){
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              name: e.name,
                              price: e.price,
                              image: e.image,
                            )));
                      },
                      child: SingleProduct(
                        name: e.name,
                        price: e.price,
                        image: e.image,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: (ctx) => DetailScreen(
                  //           name: e.name,
                  //           price: e.price,
                  //           image: e.image,
                  //         )));
                  //   },
                  //   child: SingleProduct(
                  //     name: e.name,
                  //     price: e.price,
                  //     image: e.image,
                  //   ),
                  // ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> newachives = productProvider.getNewAchivesList;
    List<Product> homeachive = productProvider.getHomeAchiveList;
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                                name: "New Achives",
                                snapShot: newachives,
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
        // Row(
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (ctx) => DetailScreen(
        //                           name: newachives.elementAt(11).name,
        //                           price: newachives.elementAt(11).price,
        //                           image: newachives.elementAt(11).image,
        //                         )));
        //               },
        //               child: SingleProduct(
        //                 name: newachives.elementAt(11).name,
        //                 price: newachives.elementAt(11).price,
        //                 image: newachives.elementAt(11).image,
        //               ),
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (ctx) => DetailScreen(
        //                           name: newachives.elementAt(1).name,
        //                           price: newachives.elementAt(1).price,
        //                           image: newachives.elementAt(1).image,
        //                         )));
        //               },
        //               child: SingleProduct(
        //                 name: newachives.elementAt(1).name,
        //                 price: newachives.elementAt(1).price,
        //                 image: newachives.elementAt(1).image,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: homeachive.map((e) {
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              name: e.name,
                              price: e.price,
                              image: e.image,
                            )));
                      },
                      child: SingleProduct(
                        name: e.name,
                        price: e.price,
                        image: e.image,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (ctx) => DetailScreen(
                  //           name: e.name,
                  //           price: e.price,
                  //           image: e.image,
                  //         )));
                  //   },
                  //   child: SingleProduct(
                  //     name: e.name,
                  //     price: e.price,
                  //     image: e.image,
                  //   ),
                  // ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getPerformanceData();
    categoryProvider.getMotorData();
    categoryProvider.getCarData();
    categoryProvider.getBicycleData();
    categoryProvider.getLogisticsData();
    ///Icon Category Data
    categoryProvider.getPerformanceIconData();
    categoryProvider.getMotorIconData();
    categoryProvider.getCarIconData();
    categoryProvider.getBicycleIconData();
    categoryProvider.getLogisticIconData();


    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getTopProductsData();
    productProvider.getNewAchivesData();
    productProvider.getHomeTopProductData();
    productProvider.getHomeAchiveData();



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
      body: Container(
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
      ),
    );
  }
}
