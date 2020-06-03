import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';

class ProductService{
  Firestore _firestore = Firestore.instance;
  String collection = 'products';

  //access featured products from product model
  Future<List<Product>> getFeaturedProducts()  =>
      _firestore.collection(collection).where('featured', isEqualTo: true).getDocuments().then((snap){
        List<Product> featuredProducts = [];
        snap.documents.map((snapshot) => featuredProducts.add(Product.fromSnapshot(snapshot)));
        return featuredProducts;
      });
}