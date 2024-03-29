import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Flower skirt",
      "picture": "images/products/skt1.jpeg",
      "price": 50,
      "size": "M",
      "color": "White",
      "quantity": 1,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Purple heels",
      "picture": "images/products/hills1.jpeg",
      "price": 50,
      "size": "7",
      "color": "Purple",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
         return Single_cart_product(
           cart_prod_name: Products_on_the_cart[index]["name"],
           cart_prod_picture: Products_on_the_cart[index]["picture"],
           cart_prod_color: Products_on_the_cart[index]["color"],
           cart_prod_size: Products_on_the_cart[index]["size"],
           cart_prod_price: Products_on_the_cart[index]["price"],
           cart_prod_qty: Products_on_the_cart[index]["quantity"],

         );
        });
  }
}
class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
   this.cart_prod_name,
   this.cart_prod_picture,
   this.cart_prod_price,
   this.cart_prod_size,
   this.cart_prod_color,
   this.cart_prod_qty,
});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        // ========== leading section ====================
        leading: new Image.asset(
          cart_prod_picture,
          width: 80.0,
          height: 80.0,
        ),


        // ============= title section ========================
        title: new Text(cart_prod_name, style: TextStyle(color: Colors.black),),

        // =========== subtitle section =======================
        subtitle: new Column(
          children: <Widget>[
            //ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>[
                // this section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size", style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: 
                  const EdgeInsets.all(2.0),
                  child: new Text(cart_prod_size, style: TextStyle(color: Colors.red),),
                ),

                // ================ this section is for the product colors
                new Padding(padding:
                const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color", style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(cart_prod_color, style: TextStyle(color: Colors.red),),
                )
              ],
            ),

            // ========== THIS SECTION IS THE PRODUCT PRICE =============
            Container(
              alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text("\$${cart_prod_price}",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          new IconButton(icon: Icon(Icons.remove), onPressed: (){}),
                          new Text("$cart_prod_qty"),
                          new IconButton(icon: Icon(Icons.add), onPressed: (){}),
                        ],
                      ),
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


