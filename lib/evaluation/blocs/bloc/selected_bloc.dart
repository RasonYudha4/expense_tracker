import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_event.dart';
part 'selected_state.dart';

class SelectedBloc extends Bloc<SelectedEvent, SelectedState> {
  SelectedBloc() : super(Current()) {
    on<SelectCurrent>(_onCurrentPressed);
    on<SelectPrevious>(_onPreviousPressed);
  }

  void _onCurrentPressed(SelectCurrent event, Emitter<SelectedState> emit) {
    emit(Current());
  }

  void _onPreviousPressed(SelectPrevious event, Emitter<SelectedState> emit) {
    emit(Previous());
  }
}
