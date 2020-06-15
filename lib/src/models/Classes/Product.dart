
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Products{
  List<Product> products = new List();
  Products();
  Products.fromJsnList(List<dynamic> jsonList){
    if(jsonList==null) return;
    for(var item in jsonList){
      final product = new Product.fromJson(item);
      products.add(product);
    }
  }
}


class Product {
  int id;
  String name;
  String category;
  String description;
  double price;
  String imageUrl;
  bool status;

  Product({
    this.id,
    this.name,
    this.category,
    this.description,
    this.price,
    this.imageUrl,
    this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    description: json["description"],
    price: json["price"],
    imageUrl: json["imageUrl"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "description": description,
    "price": price,
    "imageUrl": imageUrl,
    "status": status,
  };
}