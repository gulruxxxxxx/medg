

import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/authenticated_user.dart';
import '../../domain/repository/datas.dart';
import '../data_source/local_data_source.dart';
import '../model/authenticated_user.dart';

class AuthenticatedUserRepositoryImpl implements AuthenticatedUserRepository{
  final AuthenticatedUserLocalDataSource _dataSource;
  const AuthenticatedUserRepositoryImpl({required AuthenticatedUserLocalDataSource dataSource}):_dataSource=dataSource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser() async{
    try {
      final user = await _dataSource.getUser();
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> login(String email, String password)async {
    try {
      final user = await _dataSource.login(email, password);
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async{
    try {
      final response = await _dataSource.logout();
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure,AuthenticatedUserEntity>> sign_up(String email, String password) async{
    try {
      final response = await _dataSource.sing_up(email, password);
      return Right(AuthenticatedUserModel.fromFirebaseUser(response));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }
}