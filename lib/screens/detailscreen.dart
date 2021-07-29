import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Widget _buildSizeProduct({String name}){
    return Container(
      height: 60,
      width: 60,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  Widget _buildColorProduct({Color color}){
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
                Center(
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
                              image: AssetImage("images/sx4.jpg"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        //color: Colors.blueGrey,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ducati Panigale",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$ 300.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff9b96d6),
                                  ),
                                ),
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        //color: Colors.brown,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: [
                              Text(
                                "Year after year, the Panigale V4 is renewed to become faster and more exciting on the track for both the amateur and the professional rider. For 2021, the Panigale V4 and V4 S models become Euro 5 compliant (only for Markets where Euro 5 is applied), maintaining the maximum power and torque levels unchanged. To comply with the new European standard on polluting emissions, various refinements have been made to the Desmosedici Stradale exhaust line and to the engine calibration. The electronic package that equips the Panigale V4 also evolves and now includes the latest generation Ducati Traction Control which is even more predictive: the DTC EVO 3 with a strategy derived from Ducati Corse.The Riding Mode strategy is also new; specifically, the Race Riding Mode has been split into two mappings that can now be freely compared in the individual parameters, allowing the rider to quickly compare two different configurations to define the best set-up based on the track and riding style. The Panigale V4 and Panigale V4 S models are also equipped with new self-bleeding brake and clutch pumps derived from those used for the first time on the Superleggera V4. Among the features added to the bike for 2021 is the chain guard fin, an important safety precaution that allows you to avoid dangerous contacts with the chain and crown in the event of a slide.  In addition, for those who use the bike all year round, there is now provision for heated grips, while the ignition key has a new, more modern and elegant grip.",
                                style:
                                TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Size",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 250,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildSizeProduct(name: "S"),
                            _buildSizeProduct(name: "M"),
                            _buildSizeProduct(name: "L"),
                            _buildSizeProduct(name: "XL"),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Colors",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 250,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildColorProduct(color: Colors.green[300]),
                            _buildColorProduct(color:  Colors.black),
                            _buildColorProduct(color:  Colors.red),
                            _buildColorProduct(color:  Colors.yellowAccent),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Quentity",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
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

