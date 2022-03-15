part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class InitEvent extends Event {}

class SendEvent extends Event {}

class ChangePassEvent extends Event {
  final String value;
  ChangePassEvent(this.value);
}

class ChangeEmailEvent extends Event {
  final String value;
  ChangeEmailEvent(this.value);
}

class ChangeFullEvent extends Event {
  final String value;
  ChangeFullEvent(this.value);
}

class ChangeNameEvent extends Event {
  final String value;
  ChangeNameEvent(this.value);
}

class ChangeCheckEvent extends Event {
  final bool value;
  ChangeCheckEvent(this.value);
}

class ChangePhoneEvent extends Event {
  final int value;
  ChangePhoneEvent(this.value);
}

class ValidateEmailEvent extends Event {
  final String value;
  ValidateEmailEvent(this.value);
}


