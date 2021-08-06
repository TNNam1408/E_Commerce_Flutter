import 'package:e_commerce/model/categoryicon.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider with ChangeNotifier {

  List<CategoryIcon> performanIcon = [];
  CategoryIcon performanIconData;
  List<CategoryIcon> motorIcon = [];
  CategoryIcon motorIconData;
  List<CategoryIcon> carIcon = [];
  CategoryIcon carIconData;
  List<CategoryIcon> bicycleIcon = [];
  CategoryIcon bicycleIconData;
  List<CategoryIcon> logisticsIcon = [];
  CategoryIcon logisticsIconData;


  List<Product> performance = [];
  Product performanceData;

  List<Product> motor = [];
  Product motorData;

  List<Product> car = [];
  Product carData;

  List<Product> bicycle = [];
  Product bicycleData;

  List<Product> logistics = [];
  Product logisticsData;

  Future<void> getPerformanceIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot performanceIconSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("Nhp70bJXxmTSUISd9jWp")
        .collection("performance")
        .getDocuments();
    performanceIconSnapShot.documents.forEach(
          (element) {
        performanIconData = CategoryIcon(
            image: element.data["image"]);
        newList.add(performanIconData);
      },
    );
    performanIcon = newList;
    notifyListeners();
  }
  List<CategoryIcon> get getPerformanceIconList{
    return performanIcon;
  }

  Future<void> getMotorIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot motorIconSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("Nhp70bJXxmTSUISd9jWp")
        .collection("motor")
        .getDocuments();
    motorIconSnapShot.documents.forEach(
          (element) {
        motorIconData = CategoryIcon(
            image: element.data["image"]);
        newList.add(motorIconData);
      },
    );
    motorIcon = newList;
    notifyListeners();
  }
  List<CategoryIcon> get getMotorIconList{
    return motorIcon;
  }

  Future<void> getCarIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot carIconSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("Nhp70bJXxmTSUISd9jWp")
        .collection("car")
        .getDocuments();
    carIconSnapShot.documents.forEach(
          (element) {
        carIconData = CategoryIcon(
            image: element.data["image"]);
        newList.add(carIconData);
      },
    );
    carIcon = newList;
    notifyListeners();
  }
  List<CategoryIcon> get getCarIconList{
    return carIcon;
  }

  Future<void> getBicycleIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot bicycleIconSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("Nhp70bJXxmTSUISd9jWp")
        .collection("bicycle")
        .getDocuments();
    bicycleIconSnapShot.documents.forEach(
          (element) {
        bicycleIconData = CategoryIcon(
            image: element.data["image"]);
        newList.add(bicycleIconData);
      },
    );
    bicycleIcon = newList;
    notifyListeners();
  }
  List<CategoryIcon> get getBicycleIconList{
    return bicycleIcon;
  }

  Future<void> getLogisticIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot logisticIconSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("Nhp70bJXxmTSUISd9jWp")
        .collection("logistic")
        .getDocuments();
    logisticIconSnapShot.documents.forEach(
          (element) {
        logisticsIconData = CategoryIcon(
            image: element.data["image"]);
        newList.add(logisticsIconData);
      },
    );
    logisticsIcon = newList;
    notifyListeners();
  }
  List<CategoryIcon> get getLogisticsIconList{
    return logisticsIcon;
  }

  Future<void> getPerformanceData() async {
    List<Product> newList = [];
    QuerySnapshot performanceSnapShot = await Firestore.instance
        .collection("category")
        .document("l7HP7r5xWfWPgJYnpYqA")
        .collection("performance")
        .getDocuments();
    performanceSnapShot.documents.forEach(
      (element) {
        performanceData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(performanceData);
      },
    );
    performance = newList;
    notifyListeners();
  }
  List<Product> get getPerformanceList{
    return performance;
  }

  Future<void> getMotorData() async {
    List<Product> newList = [];
    QuerySnapshot motorSnapShot = await Firestore.instance
        .collection("category")
        .document("l7HP7r5xWfWPgJYnpYqA")
        .collection("motor")
        .getDocuments();
    motorSnapShot.documents.forEach(
          (element) {
        motorData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(motorData);
      },
    );
    motor = newList;
    notifyListeners();
  }
  List<Product> get getMotorList{
    return motor;
  }

  Future<void> getCarData() async {
    List<Product> newList = [];
    QuerySnapshot carSnapShot = await Firestore.instance
        .collection("category")
        .document("l7HP7r5xWfWPgJYnpYqA")
        .collection("car")
        .getDocuments();
    carSnapShot.documents.forEach(
          (element) {
        carData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(carData);
      },
    );
    car = newList;
    notifyListeners();
  }
  List<Product> get getCarList{
    return car;
  }

  Future<void> getBicycleData() async {
    List<Product> newList = [];
    QuerySnapshot bicycleSnapShot = await Firestore.instance
        .collection("category")
        .document("l7HP7r5xWfWPgJYnpYqA")
        .collection("bicycle")
        .getDocuments();
    bicycleSnapShot.documents.forEach(
          (element) {
            bicycleData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(bicycleData);
      },
    );
    bicycle = newList;
    notifyListeners();
  }
  List<Product> get getBicycleList{
    return bicycle;
  }

  Future<void> getLogisticsData() async {
    List<Product> newList = [];
    QuerySnapshot logisticsSnapShot = await Firestore.instance
        .collection("category")
        .document("l7HP7r5xWfWPgJYnpYqA")
        .collection("logistics")
        .getDocuments();
    logisticsSnapShot.documents.forEach(
          (element) {
            logisticsData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(logisticsData);
      },
    );
    logistics = newList;
    notifyListeners();
  }
  List<Product> get getLogisticsList{
    return logistics;
  }
}
