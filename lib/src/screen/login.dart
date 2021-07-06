import 'package:flutter/material.dart';
import 'package:market_easy/src/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    checkForToken();
  }

  checkForToken() async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    final user = (loginData.getBool('logged')) ?? true;

    if (user == false) {
      Navigator.pushNamed(context, 'home');
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authBlocs = Provider.of<AuthBloc>(context);

    return Scaffold(
      body: _loginForm(context, authBlocs),
    );
  }

  Widget _loginForm(BuildContext context, AuthBloc authBloc) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              _usernameField(authBloc),
              _passwordField(authBloc),
              _loginButton(context, authBloc),
            ])));
  }

  Widget _passwordField(AuthBloc authBloc) {
    return StreamBuilder<String>(
        stream: authBloc.password,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: authBloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              hintText: 'Password',
            ),
            validator: (value) => null,
          );
        });
  }

  Widget _usernameField(AuthBloc authBloc) {
    return StreamBuilder<String>(
        stream: authBloc.username,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: authBloc.changeUsername,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Username',
            ),
            validator: (value) => null,
          );
        });
  }

  Widget _loginButton(BuildContext context, AuthBloc authBloc) {
    return ElevatedButton(
        onPressed: () async {
          final response = await authBloc.signIn(
              authBloc.usernameValue, authBloc.passwordValue);
          if (response.toString() == "Sucesso") {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Erro"),
                    content: Text(response.toString()),
                    actions: [
                      ElevatedButton(
                        child: Text("Fechar"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          }
        },
        child: Text("Login"));
  }
}

/* class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(),
    );
  }

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              _usernameField(),
              _passwordField(),
              _loginButton(),
            ])));
  }

  Widget _passwordField() {
    return StreamBuilder<String>(
        stream: authBloc.password,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: authBloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              hintText: 'Password',
            ),
            validator: (value) => null,
          );
        });
  }

  Widget _usernameField() {
    return StreamBuilder<String>(
        stream: authBloc.username,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: authBloc.changeUsername,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Username',
            ),
            validator: (value) => null,
          );
        });
  }

  Widget _loginButton() {
    return ElevatedButton(
        onPressed: () async {
          final response = await authBloc.signIn(
              authBloc.usernameValue, authBloc.passwordValue);
          if (response.toString() == "Sucesso") {
            print("Deu bom");
            final res = await SharedPreferences.getInstance();
            print(res.getString('token'));
          } else {
            print(response.toString());
          }
        },
        child: Text('Login'));
  }
} */
