import 'package:hydrated_bloc/hydrated_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends HydratedBloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event == CounterEvent.increment) {
        emit(state + 1);
      } else if (event == CounterEvent.decrement) {
        emit(state - 1);
      }
    });
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['count'] as int;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'count': state};
  }
}
