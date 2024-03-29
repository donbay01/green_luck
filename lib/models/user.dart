class UserModel {
  final String email;
  final String uid;
  final String? displayName;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'uid': uid,
      'displayName': displayName,
    };
  }

  UserModel.fromJSON(Map<String, dynamic> json)
      : email = json['email'],
        uid = json['uid'],
        displayName = json['displayName'];

  UserModel({
    required this.email,
    required this.uid,
    required this.displayName,
  });
}
