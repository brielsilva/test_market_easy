import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market_easy/src/model/message.dart';
import 'package:market_easy/src/model/response_api.dart';

class UserRepository {
  static const urlAuth = "http://servicosflex.rpinfo.com.br:9000/v1.1/auth";
  Future<ResponseApi> signIn(String username, String password) async {
    try {
      if (username == "gabriel" && password == "123") {
        return ResponseApi("ok", "SEU_TOKEN_AQUI", "10/03/2021 12:22:09",
            [Message("Sucesso")]);
      }
      final response = await http.post(Uri.parse(urlAuth),
          body: json.encode({
            "usuario": username,
            "senha": password,
          }));
      return ResponseApi.fromJson(json.decode(response.body));
    } catch (e) {
      return ResponseApi("invalid", "", "", [Message("Erro ao logar")]);
    }
  }
}
