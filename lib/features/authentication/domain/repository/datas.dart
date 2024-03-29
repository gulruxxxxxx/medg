import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

import '../entity/authenticated_user.dart';

abstract interface class AuthenticatedUserRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> getUser();

  Future<Either<Failure, AuthenticatedUserEntity>> login(
      String email, String password);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, AuthenticatedUserEntity>> sign_up(
      String email, String password);
}
