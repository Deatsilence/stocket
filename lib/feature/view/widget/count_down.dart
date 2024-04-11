import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';

/// [CountDown] is a widget to show count down timer for OTP
final class CountDown extends StatefulWidget {
  const CountDown({
    Key? key,
    required this.startValue,
  }) : super(key: key);

  final int startValue;

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late int _counter;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _counter = widget.startValue;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLabel(
      text: '$_counter',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}
