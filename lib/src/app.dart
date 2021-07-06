import 'package:flutter/material.dart';
import 'package:market_easy/src/blocs/auth_bloc.dart';
import 'package:market_easy/src/blocs/product_bloc.dart';
import 'package:market_easy/src/routes.dart';
import 'package:market_easy/src/screen/login.dart';
import 'package:provider/provider.dart';

final authBloc = AuthBloc();
final productBloc = ProductBloc();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => authBloc),
          Provider(create: (context) => productBloc),
        ],
        child: MaterialApp(
          home: Login(),
          onGenerateRoute: Routes.materialRoutes,
        ));
  }
}
