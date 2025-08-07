part of 'selected_bloc.dart';

sealed class SelectedEvent extends Equatable {
  const SelectedEvent();

  @override
  List<Object> get props => [];
}

class SelectCurrent extends SelectedEvent {
  const SelectCurrent();
}

class SelectPrevious extends SelectedEvent {
  const SelectPrevious();
}
