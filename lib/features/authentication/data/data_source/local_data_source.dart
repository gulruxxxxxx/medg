import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/exception/exception.dart';

abstract class AuthenticatedUserLocalDataSource {
  Future<User> getUser();

  Future<User> login(String email, String password);

  Future<User> sing_up(String email, String password);

  Future<void> logout();

  factory AuthenticatedUserLocalDataSource() => _AuthenticatedUserLocalDataSourceImpl();
}

class _AuthenticatedUserLocalDataSourceImpl implements AuthenticatedUserLocalDataSource {
  @override
  Future<User> getUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerException(errorMessage: "User is null", errorCode: "140");
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        errorMessage: "$error",
        errorCode: "500",
      );
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await getUser();
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(errorMessage: "$error", errorCode: "500");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ServerException(errorMessage: "Cannot logout the user", errorCode: "500");
    }
  }

  @override
  Future<User> sing_up(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerException(errorMessage: "message", errorCode: "500");
    }
  }
}
