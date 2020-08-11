import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(this.title, {this.currentBalance, this.isHome, this.bottonRightFunction, 
    Key key,
  }) : super(key: key);
  final Function bottonRightFunction;
  final String title;
  final bool isHome;
  final String currentBalance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
             bottonRightFunction();
            }),
        Column(
          children: [
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            isHome ? Text(currentBalance,
                style: TextStyle( 
                  fontSize: 16.0,
                  color: Colors.blue,
                )) : null ,
          ],
        ),
        Icon(Icons.image),
      ],
    );
  }
}