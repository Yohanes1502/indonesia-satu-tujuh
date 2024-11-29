import 'package:flutter_bloc/flutter_bloc.dart';

// State
abstract class NumberState {}

class NumberInitial extends NumberState {}

class NumberResult extends NumberState {
  final String result;
  NumberResult(this.result);
}

abstract class NumberEvent {}

class GenerateSequence extends NumberEvent {
  final int n;
  final int type;
  GenerateSequence(this.n, this.type);
}

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  NumberBloc() : super(NumberInitial()) {
    on<GenerateSequence>((event, emit) {
      final n = event.n;
      final type = event.type;
      String result = '';

      if (type == 1) {
        result = List.generate(n, (i) => (i + 1).toString()).join(' ');
      } else if (type == 2) {
        result = [
          ...List.generate(n, (i) => (i + 1).toString()),
          ...List.generate(n - 1, (i) => (n - i - 1).toString())
        ].join(' ');
      } else if (type == 3) {
        result = List.generate(n, (i) => '${i + 1}${n - i}').join(' ');
      } else if (type == 4) {
        result = List.generate(n, (i) {
          final value = i + 1;
          if (value % 5 == 0) return 'LIMA';
          if (value % 7 == 0) return 'TUJUH';
          return value.toString();
        }).join(' ');
      }

      emit(NumberResult(result));
    });
  }
}
