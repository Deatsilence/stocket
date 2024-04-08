import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SampleView extends StatefulWidget {
  const SampleView({super.key});

  @override
  State<SampleView> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
