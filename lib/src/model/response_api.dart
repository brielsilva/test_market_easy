import 'package:market_easy/src/model/message.dart';

class ResponseApi {
  final String status;
  final String token;
  final String tokenExpiration;
  final List<Message> messages;

  ResponseApi(this.status, this.token, this.tokenExpiration, this.messages);

  ResponseApi.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? "",
        token = json['token'] ?? "",
        tokenExpiration = json['tokenExpiration'] ?? "",
        messages = List<Message>.from(
            json['messages'].map((x) => Message.fromJson(x)) ?? const []);
}
