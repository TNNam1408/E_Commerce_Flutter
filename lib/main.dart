import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/cartscreen.dart';
import 'package:e_commerce/screens/checkout.dart';
import 'package:e_commerce/screens/detailscreen.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/listproduct.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/screens/welcomescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '../screens/homepage': (context) => HomePage(),
        '../screens/detailscreen': (context) => DetailScreen(),
        '../screens/checkout': (context) => Checkout(),
        '../screens/cartscreen': (context) => CartScreen(),
        '../screens/listproduct': (context) => ListProduct(),
        '../screens/login': (context) => Login(),
        '../screens/signup': (context) => SignUp(),
        '../screens/welcomescreen': (context) => WelComeScreen(),
      },
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
            create: (ctx) => ProductProvider(),
          ),
          ChangeNotifierProvider<CategoryProvider>(
            create: (ctx) => CategoryProvider(),
          ),
        ],

        //Bac viet nhu nay, thi moi provier cho man hinh home va man hinh login thoi
        //bac dung thuoc tinh ongenerate route trong Material de init Route bac nhe
        //Cái này e cũng k hiểu lắm
        //Bác sử lí giúp e với ạ

        child: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, snapshop) {
            if (snapshop.hasData) {
              return HomePage();
            } else {
              return Login();
            }
          },
        ),
      ),
    );
  }
}

//Dai loai cho nay bac dang lam sai roi
class Routes {
  static Route routes(RouteSettings settings) {
    switch(settings.name) {
      case 'home':

    }
  }

}
