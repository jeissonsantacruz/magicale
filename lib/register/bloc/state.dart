part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  InitialState(Model model) : super(model);
}

class SendingState extends State {
  SendingState(Model model) : super(model);
}

class SendedState extends State {
  SendedState(Model model) : super(model);
}

class ChangeNameState extends State {
  ChangeNameState(Model model) : super(model);
}

class ChangePassState extends State {
  ChangePassState(Model model) : super(model);
}

class ChangePhoneState extends State {
  ChangePhoneState(Model model) : super(model);
}

class ChangeFullState extends State {
  ChangeFullState(Model model) : super(model);
}

class ChangeEmailState extends State {
  ChangeEmailState(Model model) : super(model);
}

class ChangeCheckState extends State {
  ChangeCheckState(Model model) : super(model);
}

class VerifyEmailState extends State {
  VerifyEmailState (Model model) : super(model);
}
class VerifiedEmailState extends State {
  VerifiedEmailState (Model model) : super(model);
}
class ErrorState extends State {
  final String error;
  ErrorState(Model model, {@required this.error}) : super(model);

  @override
  List<Object> get props => [error];
}

class FailureDownloadingState extends State {
  final String error;

  FailureDownloadingState({
    Model model,
    @required this.error,
  }) : super(model);

  @override
  List<Object> get props => [error, model];
}

class Model extends Equatable {
  final String password;
  final String name;
  final String email;
  final String full;
  final int phone;
  final bool checkPolicities;

  Model(
      {this.password,
      this.name,
      this.email,
      this.full,
      this.phone,
      this.checkPolicities });

  Model copyWith(
          {String password,
          String name,
          String full,
          String email,
          bool checkPolicities,
          int phone}) =>
      Model(
          password: password ?? this.password,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          full: full ?? this.full,
          checkPolicities: checkPolicities ?? this.checkPolicities,
          email: email ?? this.email);
  // validations to the form
  bool get isNameValid => (name ?? '').length >= 3;
  bool get isPhoneValid => (full ?? '').length >= 3;
  bool get isPassValid => (password ?? '').length >= 3;
  bool get isEmailValid => (email ?? '').length >= 3;
  bool get isFullValid => (phone?.toString() ?? '').length >= 3;

  bool get isActive => (isNameValid &&
      isPhoneValid &&
      isPassValid &&
      isEmailValid &&
      isFullValid &&
      checkPolicities);

  @override
  List<Object> get props => [password, name, isActive, full, phone, phone,checkPolicities];
}
