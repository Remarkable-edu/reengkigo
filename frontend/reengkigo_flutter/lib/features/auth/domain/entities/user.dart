import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int accountId;
  final int accountTypeId;
  final int agencyId;
  final int academyId;
  final String account;
  final int state;

  const User({
    required this.accountId,
    required this.accountTypeId,
    required this.agencyId,
    required this.academyId,
    required this.account,
    required this.state,
  });

  @override
  List<Object> get props => [
        accountId,
        accountTypeId,
        agencyId,
        academyId,
        account,
        state,
      ];
}