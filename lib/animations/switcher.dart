
/// Switcher

import 'package:flutter/material.dart';


void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Alignment alignment = Alignment.centerRight;
  Color color =  Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            alignment = (alignment ==Alignment.centerRight)? Alignment.centerLeft : Alignment.centerRight;
            color = (alignment ==Alignment.centerLeft)? Colors.red : Colors.green;
            setState(() {});
          },
          child: AnimatedContainer(
            //curve: Curves.bounceIn,
            alignment: alignment,
            duration: const Duration(milliseconds: 250),
            width: 220,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: color,
            ),
            child: const Icon(Icons.circle,color: Colors.white, size: 80,),
          ),
        ),
      ),
    );
  }
}
