part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoggedIn extends AuthenticationState {
  User user;

  AuthenticationLoggedIn({
    required this.user,
  });

  @override
  String toString() => 'AuthenticationLoggedIn(user: $user)';

  AuthenticationLoggedIn copyWith({
    User? user,
  }) {
    return AuthenticationLoggedIn(
      user: user ?? this.user,
    );
  }
}

class AuthenticationLoggedOut extends AuthenticationState {}
