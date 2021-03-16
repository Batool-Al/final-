import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({

    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: SvgPicture.asset('assets/icons/bg.svg'),
            height: 100,
            width:100,
            right: 100,
            bottom: 100,

          ),

          child,
        ],
      ),
    );
  }
}