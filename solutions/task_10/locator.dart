import 'package:get_it/get_it.dart';
import 'bloc/data_receiver_bloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<DataReceiverBloc>(DataReceiverBloc());
}
