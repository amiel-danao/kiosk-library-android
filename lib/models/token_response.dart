class TokenResponse {
  final String token;
  final int userId;
  final String email;

  TokenResponse({required this.token, required this.userId, required this.email});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(token: json['token']??'', userId: json['user_id']??-1, email: json['email']??'');
  }

  Map<String, dynamic> toJson() =>
      {'token': token, 'user_id': userId, 'email': email};
}

