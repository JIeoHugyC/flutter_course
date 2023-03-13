import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

extension TesterExtention on WidgetTester{
  Size get windowSize{
    return binding.window.physicalSize /
        binding.window.devicePixelRatio;
  }
}