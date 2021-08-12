
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/cartscreen.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;

  DetailScreen({this.image, this.name, this.price});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  ProductProvider productProvider ;
  final TextStyle myStyleBold =
      TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);

  final TextStyle myStyle = TextStyle(fontSize: 20, color: Colors.black);

  Widget _buildSizeProduct({String name}) {
    return Container(
      height: 60,
      width: 60,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildColorProduct({Color color}) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  Widget _buildImage() {
    return Center(
      child: Container(
        width: 350,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Container(
      height: 100,
      //color: Colors.blueGrey,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: myStyleBold,
              ),
              Text(
                "\$ ${widget.price.toString()}",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff9b96d6),
                ),
              ),
              Text("Description", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscription() {
    return Container(
      height: 300,
      //color: Colors.brown,
      child: ListView(
        children: [
          Wrap(
            children: [
              Text(
                "Year after year, the Panigale V4 is renewed to become faster and more exciting on the track for both the amateur and the professional rider. For 2021, the Panigale V4 and V4 S models become Euro 5 compliant (only for Markets where Euro 5 is applied), maintaining the maximum power and torque levels unchanged. To comply with the new European standard on polluting emissions, various refinements have been made to the Desmosedici Stradale exhaust line and to the engine calibration. The electronic package that equips the Panigale V4 also evolves and now includes the latest generation Ducati Traction Control which is even more predictive: the DTC EVO 3 with a strategy derived from Ducati Corse.The Riding Mode strategy is also new; specifically, the Race Riding Mode has been split into two mappings that can now be freely compared in the individual parameters, allowing the rider to quickly compare two different configurations to define the best set-up based on the track and riding style. The Panigale V4 and Panigale V4 S models are also equipped with new self-bleeding brake and clutch pumps derived from those used for the first time on the Superleggera V4. Among the features added to the bike for 2021 is the chain guard fin, an important safety precaution that allows you to avoid dangerous contacts with the chain and crown in the event of a slide.  In addition, for those who use the bike all year round, there is now provision for heated grips, while the ignition key has a new, more modern and elegant grip.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Version ",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSizeProduct(name: "Uni"),//Universal version
              _buildSizeProduct(name: "Pre"),//Premium version
              _buildSizeProduct(name: "LiE"),//Limited Edition
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorProduct(color: Colors.blue),
              _buildColorProduct(color: Colors.red),
              _buildColorProduct(color: Colors.yellowAccent),
              _buildColorProduct(color: Colors.green),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quentity",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
                child: Icon(Icons.remove),
              ),
              Text(
                count.toString(),
                style: myStyle,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonPart() {
    return MyButton(
      name: "Checkout",

      onPressed: () {
        productProvider.getCartData(
          image: widget.image,
          name:  widget.name,
          price: widget.price,
          quentity: count,
        );

        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => CartScreen()));
      },
    );
  }
//dung roi
  //nay la stateufull thì widget.context la ok


  @override
  Widget build(BuildContext context) {
    //productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(
        //         new MaterialPageRoute(builder: (ctx) =>HomePage()));
        //   },
        // ),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                _buildImage(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNameToDescriptionPart(),
                      _buildDiscription(),
                      _buildSizePart(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildColorPart(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildQuentityPart(),
                      SizedBox(
                        height: 15,
                      ),

                      _buildButtonPart(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
