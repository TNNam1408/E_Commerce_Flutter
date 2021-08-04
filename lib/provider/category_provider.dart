import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider with ChangeNotifier {
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
