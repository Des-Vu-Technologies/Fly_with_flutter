import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> with HydratedMixin {
  TodoCubit() : super(TodoState([]));

  void addTask(Map<String, dynamic> task) {
    final updatedTasks = [...state.tasks];
    updatedTasks.add(task);
    emit(TodoState(updatedTasks));
  }

  void removeTask(int index) {
    final updatedTasks = [...state.tasks];
    updatedTasks.removeAt(index);
    emit(TodoState(updatedTasks));
  }

  @override
  TodoState fromJson(Map<String, dynamic> json) {
    final tasks = (json['tasks'] as List<dynamic>).cast<
        Map<String, dynamic>>(); // Ensure the tasks are of the correct type
    return TodoState(tasks);
  }

  @override
  Map<String, dynamic> toJson(TodoState state) {
    return {'tasks': state.tasks};
  }
}
