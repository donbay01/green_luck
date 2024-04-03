class UserModel {
  final String email;
  final String uid;
  final String? displayName;
  final String? role;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'uid': uid,
      'displayName': displayName,
      'role': 'user',
    };
  }

  UserModel.fromJSON(Map<String, dynamic> json)
      : email = json['email'],
        uid = json['uid'],
        displayName = json['displayName'],
        role = json['role'] ?? 'user';

  UserModel({
    required this.email,
    required this.uid,
    required this.displayName,
    this.role,
  });
}
