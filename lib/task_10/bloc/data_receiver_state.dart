part of 'data_receiver_bloc.dart';

@immutable
abstract class DataReceiverState {}

class DataReceiverIdle extends DataReceiverState {}

class DataReceiverInitializing extends DataReceiverState {}

class DataReceiverLoading extends DataReceiverState {
  final double progress;

  DataReceiverLoading(this.progress);
}

class DataReceiverFinished extends DataReceiverState {
  final String data;

  DataReceiverFinished(this.data);
}
