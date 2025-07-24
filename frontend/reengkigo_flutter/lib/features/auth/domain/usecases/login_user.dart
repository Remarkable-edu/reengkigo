import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUser implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(
      account: params.account,
      password: params.password,
      rememberAccount: params.rememberAccount,
      autoLogin: params.autoLogin,
    );
  }
}

class LoginParams extends Equatable {
  final String account;
  final String password;
  final bool rememberAccount;
  final bool autoLogin;

  const LoginParams({
    required this.account,
    required this.password,
    this.rememberAccount = false,
    this.autoLogin = false,
  });

  @override
  List<Object> get props => [account, password, rememberAccount, autoLogin];
}