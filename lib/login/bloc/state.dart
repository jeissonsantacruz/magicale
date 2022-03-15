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
class ValidateEmailState extends State {
  ValidateEmailState(Model model) : super(model);
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

  Model({
    this.password,
    this.name,
  });

  Model copyWith({
    String password,
    String name,
  }) =>
      Model(
        password: password ?? this.password,
        name: name ?? this.name,
      );
  // validations to the form
  bool get isNameValid => (name ?? '').length >= 3;


  bool get isActive => (isNameValid);

  @override
  List<Object> get props => [password, name, isActive];
}
