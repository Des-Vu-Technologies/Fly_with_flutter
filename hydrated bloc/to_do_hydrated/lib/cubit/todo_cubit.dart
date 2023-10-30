import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> with HydratedMixin {
  TodoCubit() : super(TodoState([]));

  void addTask(String task) {
    final updatedTasks = [...state.tasks, task];
    emit(TodoState(updatedTasks));
  }

  void removeTask(int index) {
    final updatedTasks = List<String>.from(state.tasks);
    updatedTasks.removeAt(index);
    emit(TodoState(updatedTasks));
  }

  @override
  TodoState fromJson(Map<String, dynamic> json) {
    return TodoState((json['tasks'] as List<dynamic>).cast<String>());
  }

  @override
  Map<String, dynamic> toJson(TodoState state) {
    return {'tasks': state.tasks};
  }
}
