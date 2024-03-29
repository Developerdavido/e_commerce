import 'package:ecommerce/commons/common.dart';
import 'package:ecommerce/commons/loading.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/provider/app_provider.dart';
import 'package:ecommerce/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//my imports
import 'package:ecommerce/components/horizontal_list_view.dart';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    AppProvider appProvider = Provider.of<AppProvider>(context);
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay:true,
        dotColor: Colors.transparent ,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: deepOrange),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[50],
          elevation: 0.0,
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              ),
              validator: (value) {
              if (value.isEmpty) {
              return "The search field cannot be empty";
              }
              return null;
              },),

        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.deepOrange,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.deepOrange,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//         header
            new UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('dsimeon20@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.black
              ),
            ),
//            body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.shopping_cart, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: (){
                user.signOut();
              },
              child: ListTile(
                title: Text('Logout', style: TextStyle(color: Colors.black, fontSize: 18),),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          // padding widget
          //image carousel
          image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                margin: EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: new Text('Categories',
                  style: TextStyle(color: Colors.white),
                )
            ),
          ),
          //Horizontal listviiew begins here
          HorizontalList(),

          // padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                margin: EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: new Text(
                  'Recent products',
                  style: TextStyle(color: Colors.white),
                )
            ),
          ),

          Text(appProvider.featureProducts.length.toString(), style: TextStyle(color: black),),
          //grid view

          //coding for the products
          Flexible(
              child: Products()) ,
        ],
      ),
    );
  }

  void signOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }
}


