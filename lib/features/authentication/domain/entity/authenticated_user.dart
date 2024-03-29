class AuthenticatedUserEntity {
  final String email;

  const AuthenticatedUserEntity({
    required this.email,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticatedUserEntity &&
        other.email == email ;

  }

  @override
  int get hashCode => email.hashCode ;

  @override
  String toString() => 'AuthenticatedUserEntity(email: $email)';

  AuthenticatedUserEntity copyWith({
    String? email,
  }) {
    return AuthenticatedUserEntity(
      email: email ?? this.email,
    );
  }
}
