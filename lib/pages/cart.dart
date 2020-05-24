import 'package:flutter/material.dart';

//my imports
import 'package:ecommerce/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
        ],
      ),

      body: new Cart_products(),

      bottomNavigationBar: new Container(
        color: Colors.black,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("Total", style: TextStyle(color: Colors.white),),
                subtitle: new Text("\$230", style: TextStyle(color: Colors.grey),),
              ),
            ),
            Expanded(
              child: new MaterialButton(onPressed: (){},
                child: new Text("Check out", style: TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
