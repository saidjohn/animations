


import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final text = 'My group is Flutter B28';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0,end: text.length),
            duration: const Duration(seconds: 3),
            builder: (_,viewLength,__){
              debugPrint(viewLength.toString());
              return Text(text.substring(0,viewLength),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),);
            }
        ),
      ),
    );
  }
}
