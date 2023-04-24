import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String user;
  final String type;
  final String token;
  final int phone;
  int verified;
  final List<dynamic> cart;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.user,
    required this.type,
    required this.token,
    required this.phone,
    required this.verified,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'user': user,
      'type': type,
      'token': token,
      'phone': phone,
      'verified': verified,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      user: map['user'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
      verified: map['verified']?.toInt() ?? 0,
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? user,
    String? type,
    String? token,
    int? phone,
    int? verified,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      user: user ?? this.user,
      type: type ?? this.type,
      token: token ?? this.token,
      phone: phone ?? this.phone,
      verified: verified ?? this.verified,
      cart: cart ?? this.cart,
    );
  }
}
