import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/task_10/bloc/data_receiver_bloc.dart';

class DataLoader extends StatefulWidget {
  const DataLoader({Key? key}) : super(key: key);

  @override
  State<DataLoader> createState() => _DataLoaderState();
}

class _DataLoaderState extends State<DataLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _animationCompleted = false;
  double _curProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _animationCompleted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildProgressBar(double begin, double end) {
    Animation<double> animation =
        Tween<double>(begin: begin, end: end).animate(_controller);
    _curProgress = end;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return LinearProgressIndicator(
            minHeight: 50,
            value: animation.value,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataReceiverBloc, DataReceiverState>(
      builder: (context, state) {
        if (state is DataReceiverFinished || state is DataReceiverLoading) {
          _controller.forward(from: 0);
        }
        if (state is DataReceiverIdle) {
          return const Text('Some data');
        } else if (state is DataReceiverInitializing) {
          _curProgress = 0.0;
          return const LinearProgressIndicator();
        } else if (state is DataReceiverFinished) {
          return AnimatedCrossFade(
              firstChild: _buildProgressBar(_curProgress, 1),
              secondChild: Text(state.data),
              crossFadeState: _animationCompleted
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300));
        } else if (state is DataReceiverLoading) {
          _animationCompleted = false;
          return _buildProgressBar(_curProgress, state.progress / 100);
        }
        return Container();
      },
    );
  }
}
