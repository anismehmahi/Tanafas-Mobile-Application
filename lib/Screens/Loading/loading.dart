import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tnafes/constants.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      child: Center(

        child: SpinKitRipple(
          color: kPrimaryColor,
          size: 60,
        ),
      ),
    );
  }
}
