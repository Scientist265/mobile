import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/constant.dart';

class MyCountdown extends StatefulWidget {
  const MyCountdown({Key? key}) : super(key: key);

  @override
  _MyCountdownState createState() => _MyCountdownState();
}

class _MyCountdownState extends State<MyCountdown> {
  late Timer _timer;
  int _countdown = 60;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resend in $_countdown sec',
      style: const TextStyle(color: Color(0xff2EBA64)),
    );
  }
}
