import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:magicale/login/repository/respository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'event.dart';
part 'state.dart';

// Class that contains the  bloc of singup user
class Bloc extends bloc.Bloc<Event, State> {
  final Repository repository;
  Bloc([Repository repository])
      : repository = repository ??= Repository(),
        super(initialState);

  static State get initialState => InitialState(
        Model(),
      );

  @override
  Stream<State> mapEventToState(Event event) async* {
    if (event is SendEvent) {
      yield* _sendEvent(event);
    } else if (event is ChangeNameEvent) {
      yield* _changeNameEvent(event);
    } else if (event is ChangePassEvent) {
      yield* _changePassEvent(event);
    }
  }

  // Stream that send the user data to the server
  Stream<State> _sendEvent(SendEvent event) async* {
    yield SendingState(state.model);

    try {
      final data = {
        'username': state.model.name,
        'password': state.model.password,
      };
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String,dynamic> response =await repository.createUser(
        data,
      );
      if(response["success"]){
        if (response["verifiedEmail"]){
            prefs.setString('accessToken', (response["accessToken"]));
        } else if (!response["verifiedEmail"]){
            yield ValidateEmailState(state.model);
        }
        yield SendedState(state.model);
      }
    } catch (error) {
      yield ErrorState(state.model, error: error.toString());
    }
  }

  // Stream that change the pass field
  Stream<State> _changePassEvent(ChangePassEvent event) async* {
    yield ChangePassState(
      state.model.copyWith(
        password: event.value
      ),
    );
  }

// Stream that change the name field
  Stream<State> _changeNameEvent(ChangeNameEvent event) async* {
    yield ChangeNameState(
      state.model.copyWith(
        name: event.value,
      ),
    );
  }
}
