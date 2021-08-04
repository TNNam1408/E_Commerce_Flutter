import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
class ProductProvider with ChangeNotifier{

  List<Product> hometopproduct = [];
  Product hometopproductData;

  List<Product> homeachive = [];
  Product homeachiveData;

  List<Product> topproducts = [];
  Product topproductsData;

  List<Product> newachives = [];
  Product newachivesData;

  Future<void> getHomeTopProductData() async {
    List<Product> newList = [];
    QuerySnapshot hometopproductSnapShot = await Firestore.instance
        .collection("products")
        .document("NmosClmieY6PfadcS9Nl")
        .collection("hometopproduct")
        .getDocuments();
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
  List<Product> get getHomeTopProductList{
    return hometopproduct;
  }

  Future<void> getHomeAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot homeachiveSnapShot = await Firestore.instance
        .collection("products")
        .document("NmosClmieY6PfadcS9Nl")
        .collection("homechives")
        .getDocuments();
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
  List<Product> get getHomeAchiveList{
    return homeachive;
  }

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
  List<Product> get getTopProductsList{
    return topproducts;
  }

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
  List<Product> get getNewAchivesList{
    return newachives;
  }
}
