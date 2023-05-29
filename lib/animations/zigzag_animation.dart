


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData( useMaterial3: true, ),
      home: const Animation() ,
    );
  }
}


class Animation extends StatefulWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  double ballX = 0;
  double ballY = 0;
  double hight = 0;
  double widht = 0;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    hight =MediaQuery.of(context).size.height;
    widht =MediaQuery.of(context).size.width;
    ballX = widht / 2 - 35;
    ballY = 100;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            left: ballX,
            bottom: ballY,
            duration: const Duration(seconds: 1),
            child: const Icon(CupertinoIcons.circle_filled,
              color: Colors.black,
              shadows: [
                Shadow(
                  color: Colors.blueGrey,
                  offset: Offset(10,10),
                  blurRadius: 10,
                ),
                Shadow(
                  color: Colors.blueGrey,
                  offset: Offset(-10,10),
                  blurRadius: 10,
                ),
                Shadow(
                  color: Colors.blueGrey,
                  offset: Offset(10,-10),
                  blurRadius: 10,
                ),
                Shadow(
                  color: Colors.blueGrey,
                  offset: Offset(-10,-10),
                  blurRadius: 10,
                ),
              ],
              size: 70,
            ),
            onEnd: (){
              if(ballY < hight){
                if(ballX < widht /2){
                  if(ballX == widht / 2 -35){
                    ballX += widht / 2 - 35;
                    ballY += widht / 2 - 35;
                  }else{
                    ballX += widht - 70;
                    ballY += widht / 2 - 35;
                  }
                }else{
                  ballX -= widht - 70;
                  ballY += widht / 2 - 35;
                }
                setState(() {});
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(ballY < hight){
            if(ballX < widht / 2 ){
              if(ballX == widht  / 2 - 35){
                ballX += widht / 2 - 35;
                ballY += widht / 2 - 25;
              }else{
                ballX += widht - 70;
                ballY += widht / 2 - 35;
              }
            }else{
              ballX -= widht  - 70;
              ballY += widht / 2 - 35;
            }
            setState(() {});
          }
        },
        child: const Icon(Icons.play_circle, color:  Colors.grey,),
      ),
    );
  }
}
