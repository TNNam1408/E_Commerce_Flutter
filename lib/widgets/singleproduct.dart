import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;


  SingleProduct({this.image, this.price, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 240,
        width: 160,
        //color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 140,
                width: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit:BoxFit.fill,
                      image: NetworkImage(image)),
                ),
              ),
            ),
            Text("\$ ${price.toString()}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xff9b96d6)),),
            Text(name,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),)
          ],
        ),
      ),
    );
  }
}
