import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("HomePage",
        style: TextStyle(color: Colors.black),),
        centerTitle:  true,
        elevation:  0.0,
        backgroundColor: Colors.grey[400],
        leading: IconButton(onPressed: (){
          _scaffoldKey.currentState.openDrawer();
        },
            icon: Icon(Icons.menu, color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: Colors.black)),
          IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Colors.black)),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              height: 190,
              width: double.infinity,
               color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured"),
                      Text("See All"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
