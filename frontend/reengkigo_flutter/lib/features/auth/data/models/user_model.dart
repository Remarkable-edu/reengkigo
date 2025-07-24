import '../../domain/entities/user.dart';
import '../../../../generated/login.pb.dart';

class UserModel extends User {
  const UserModel({
    required super.accountId,
    required super.accountTypeId,
    required super.agencyId,
    required super.academyId,
    required super.account,
    required super.state,
  });

  factory UserModel.fromProto(Auth auth) {
    return UserModel(
      accountId: auth.accountId,
      accountTypeId: auth.accountTypeId,
      agencyId: auth.agencyId,
      academyId: auth.academyId,
      account: auth.account,
      state: auth.state,
    );
  }

  Auth toProto() {
    return Auth()
      ..accountId = accountId
      ..accountTypeId = accountTypeId
      ..agencyId = agencyId
      ..academyId = academyId
      ..account = account
      ..state = state;
  }
}