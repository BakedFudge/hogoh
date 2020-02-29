import 'package:flutter_spinkit/flutter_spinkit.dart' ;
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red[100],
          size:50.0,
        ),
      ),
    );
  }
}

