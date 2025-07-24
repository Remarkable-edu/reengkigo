import '../../../../core/error/failures.dart';
import '../../../../generated/login.pb.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String account,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // FFI 클라이언트를 여기서 직접 사용하지 않고, 외부에서 주입받도록 개선
  final Future<LoginResponse?> Function(String account, String password) ffiLoginClient;

  AuthRemoteDataSourceImpl({
    required this.ffiLoginClient,
  });

  @override
  Future<UserModel> login({
    required String account,
    required String password,
  }) async {
    try {
      final response = await ffiLoginClient(account, password);
      
      if (response == null) {
        throw const FFIFailure('FFI 호출에서 응답을 받지 못했습니다.');
      }

      if (response.success && response.hasAuth()) {
        return UserModel.fromProto(response.auth);
      } else if (!response.success && response.hasError()) {
        final error = response.error;
        throw FFIFailure(error.userMessage);
      } else {
        throw const FFIFailure('예상치 못한 응답 구조입니다.');
      }
    } catch (e) {
      if (e is FFIFailure) {
        rethrow;
      }
      throw FFIFailure('로그인 중 오류가 발생했습니다: $e');
    }
  }
}