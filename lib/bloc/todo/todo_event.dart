part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String task;
  const AddTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final Object task;
  const RemoveTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}
