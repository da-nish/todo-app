class UserModel {
  String name;
  String email;
  String accountId;
  String token;
  String flow;
  UserModel(
      {required this.name,
      required this.email,
      required this.accountId,
      required this.token,
      this.flow = "default"});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "accountId": accountId,
        "token": token,
        "flow": flow
      };
}
