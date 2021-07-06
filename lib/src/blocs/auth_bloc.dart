import 'package:market_easy/src/model/message.dart';
import 'package:market_easy/src/model/user.dart';
import 'package:market_easy/src/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  String get usernameValue => _username.value;
  String get passwordValue => _password.value;

  Stream<String> get username => _username.stream;
  Stream<String> get password => _password.stream;

  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _username.close();
    _password.close();
  }

  Future<Message> signIn(String username, String password) async {
    final repository = UserRepository();
    final response = await repository.signIn(username.trim(), password.trim());
    if (response.status == "ok") {
      final message =
          await cacheToken(response.token, response.tokenExpiration);
      if (message.toString() == "Sucesso") {
        return Message("Sucesso");
      } else {
        print("Fora do Okay");
        return message;
      }
    } else {
      return Message(response.messages[0].message.toString());
    }
  }

  cacheToken(String token, String tokenExpiration) async {
    try {
      final loginData = await SharedPreferences.getInstance();
      await loginData.setBool('logged', true);
      await loginData.setString('tokenExpiration', tokenExpiration);
      await loginData.setString('token', token);
      return Message("Sucesso");
    } catch (e) {
      return Message("Um erro ocorreu");
    }
  }
}
