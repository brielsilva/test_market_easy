import 'package:market_easy/src/model/message.dart';
import 'package:market_easy/src/model/products.dart';

class ResponseProduct {
  final String status;
  final List<Message> messages;
  final List<Products> products;

  ResponseProduct(this.status, this.messages, this.products);

  ResponseProduct.fromJson(Map<String, dynamic> json)
      : messages = List<Message>.from(
            json['messages'].map((x) => Message.fromJson(x)) ?? const []),
        status = json["status"] ?? "",
        products = List<Products>.from(
            json['produtos'].map((x) => Message.fromJson(x)) ?? const []);
}
