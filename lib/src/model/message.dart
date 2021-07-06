class Message {
  final String message;

  Message(this.message);

  Message.fromJson(Map<String, dynamic> json) : message = json['message'];

  @override
  String toString() {
    return this.message;
  }
}
