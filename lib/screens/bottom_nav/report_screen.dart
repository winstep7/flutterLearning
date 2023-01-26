// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scale/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // int _counter = 0;

  // void _countUp() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _countdown() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Time Stamp ${DateTime.now().microsecondsSinceEpoch}'),
        Consumer<CounterProvider>(
          builder: (context, counter, child) => Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter.counterUp();
                  },
                  child: Text('Counter +'),
                ),
                Text(
                  counter.getCounter.toString(),
                  style: TextStyle(fontSize: 100),
                ),
                ElevatedButton(
                  onPressed: () {
                    counter.counterDown();
                  },
                  child: Text('Counter -'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
