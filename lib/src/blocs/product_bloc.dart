import 'package:market_easy/src/model/message.dart';
import 'package:market_easy/src/model/products.dart';
import 'package:market_easy/src/repository/products_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductBloc {
  Future<List<Products>> getProducts() async {
    try {
      final productRepository = ProductRepository();
      final data = await SharedPreferences.getInstance();
      final products =
          await productRepository.getProducts(data.getString('token') ?? "");
      if (products.status == "ok") {
        return products.products;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
