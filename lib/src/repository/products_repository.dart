import 'dart:convert';

import 'package:market_easy/src/model/message.dart';
import 'package:market_easy/src/model/products.dart';
import 'package:http/http.dart' as http;
import 'package:market_easy/src/model/response_product.dart';

class ProductRepository {
  static const productUrl =
      "http://servicosflex.rpinfo.com.br:9000/v2.0/produtounidade/listaprodutos/0/unidade/83402711000110";

  Future<ResponseProduct> getProducts(String token) async {
    try {
      final response =
          await http.get(Uri.parse(productUrl), headers: {"token": token});
      final body = ResponseProduct.fromJson(json.decode(response.body));
      return body;
    } catch (e) {
      return ResponseProduct(
          "invalid", [Message("Erro ao Carregar os dados")], []);
    }
  }
}
