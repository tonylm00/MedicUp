class User {
  late final String email;
  final String pw;

  User({required this.email, required this.pw});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], pw: json['pw']);
  }
  dynamic toJson() => {'email': email, 'pw': pw};
}
