import 'package:flutter/material.dart';
import 'package:market_easy/src/blocs/product_bloc.dart';
import 'package:market_easy/src/model/products.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final productBloc = Provider.of<ProductBloc>(context);
    final products = productBloc.getProducts().asStream();
    int? length;
    List<Products>? array;

    return Scaffold(
        appBar: AppBar(
          title: Text('Home Market Easy'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.red),
              onPressed: () async {
                final loginData = await SharedPreferences.getInstance();
                loginData.setBool('logged', false);
                loginData.setString('token', '');
                loginData.setString('tokenExpiration', '');
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: StreamBuilder<List<Products>>(
          stream: products,
          builder: (context, snapshot) {
            array = snapshot.data;
            if (array != null) {
              length = array?.length;
            } else {
              array = [];
              length = 0;
            }
            return snapshot.hasData
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      String? title = array![index].description;
                      String? price = array![index].unitValue;
                      return ListTile(
                        title: Text(price != null ? price : ""),
                        subtitle: Text(title != null ? title : ""),
                      );
                    },
                    itemCount: length)
                : Center(child: Text('Sem dados'));
          },
        ));
  }
}
