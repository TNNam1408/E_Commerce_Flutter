import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/cartmodel.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> hometopproduct = [];
  Product hometopproductData;
  Future<void> getHomeTopProductData() async {
    List<Product> newList = [];
    QuerySnapshot hometopproductSnapShot =
        await Firestore.instance.collection("hometopproduct").getDocuments();
    hometopproductSnapShot.documents.forEach(
      (element) {
        hometopproductData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(hometopproductData);
      },
    );
    hometopproduct = newList;
    notifyListeners();
  }

  List<Product> get getHomeTopProductList {
    return hometopproduct;
  }

  List<Product> homeachive = [];
  Product homeachiveData;
  Future<void> getHomeAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot homeachiveSnapShot =
        await Firestore.instance.collection("homeachives").getDocuments();
    homeachiveSnapShot.documents.forEach(
      (element) {
        homeachiveData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(homeachiveData);
      },
    );
    homeachive = newList;
    notifyListeners();
  }

  List<Product> get getHomeAchiveList {
    return homeachive;
  }

  List<Product> topproducts = [];
  Product topproductsData;
  Future<void> getTopProductsData() async {
    List<Product> newList = [];
    QuerySnapshot topproductsSnapShot = await Firestore.instance
        .collection("products")
        .document("NmosClmieY6PfadcS9Nl")
        .collection("topproducts")
        .getDocuments();
    topproductsSnapShot.documents.forEach(
      (element) {
        topproductsData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(topproductsData);
      },
    );
    topproducts = newList;
    notifyListeners();
  }

  List<Product> get getTopProductsList {
    return topproducts;
  }

  List<Product> newachives = [];
  Product newachivesData;
  Future<void> getNewAchivesData() async {
    List<Product> newList = [];
    QuerySnapshot newachivesSnapShot = await Firestore.instance
        .collection("products")
        .document("NmosClmieY6PfadcS9Nl")
        .collection("newachives")
        .getDocuments();
    newachivesSnapShot.documents.forEach(
      (element) {
        newachivesData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(newachivesData);
      },
    );
    newachives = newList;
    notifyListeners();
  }

  List<Product> get getNewAchivesList {
    return newachives;
  }

  List<CartModel> cartModelList = [];
  CartModel cartModel;

  void getCartData({
    String name,
    String image,
    int quentity,
    double price,
  }) {
    cartModel = CartModel(
      name: name,
      image: image,
      price: price,
      quentity: quentity,
    );
    cartModelList.add(cartModel);
  }
  List<CartModel> get getCartModelList{
    return List.from(cartModelList);
  }
  int get getCartModelListLength{
    return cartModelList.length;
  }
}
