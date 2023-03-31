import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_receiver_event.dart';
part 'data_receiver_state.dart';

class DataReceiverBloc extends Bloc<DataReceiverEvent, DataReceiverState> {
  int dataPart = 1;
  DataReceiverBloc() : super(DataReceiverIdle()) {
    on<StartLoadingEvent>((event, emit) async {
      if (state is DataReceiverIdle || state is DataReceiverFinished){
        emit(DataReceiverInitializing());
        await Future.delayed(const Duration(seconds: 1));
        int progress = 0;
        while (progress < 100){
          // progress = Random().nextInt(100 - progress + 1) + progress;
          progress += 25;
          await Future.delayed(const Duration(seconds: 1));
          emit(DataReceiverLoading(progress.toDouble()));
        }
        emit(DataReceiverFinished('Loaded data part $dataPart'));
        dataPart++;
      } else {
        throw StateError('Invalid state: $state');
      }
    });
  }
}
