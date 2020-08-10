import 'package:flutter/material.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration( 
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.only(
             topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        )
      ),
    );
  }
}