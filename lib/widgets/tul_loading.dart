import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TulLoading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext  cont) =>WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Lottie.asset('assets/animations/green.json'),
      ),
    );
  }
}
