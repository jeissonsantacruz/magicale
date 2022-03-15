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

class ChangeNameEvent extends Event {
  final String value;
  ChangeNameEvent(this.value);
}
