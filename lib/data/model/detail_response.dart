import 'package:prj_reqres/data/model/users_response.dart';

class DetailUserResponse {
  User user;
  Support support;

  DetailUserResponse({
    required this.user,
    required this.support,
  });

  factory DetailUserResponse.fromJson(Map<String, dynamic> json) =>
      DetailUserResponse(
        user: User.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );
}

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );
}
