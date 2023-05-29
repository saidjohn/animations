
/// changing colors animation

import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
  int index = 0;
  bool onPress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            AnimatedContainer(
              width: 200,
              height: 200,
              duration: const Duration(milliseconds: 400),
              color: Colors.primaries[index],
              onEnd: onEnd,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                onPress = onPress ? false : true;
                if (onPress) {
                  setState(() {
                    index++;
                  });
                }
              },
              color: Colors.grey,
              child: const Text('START'),
            ),
          ],
        ),
      ),
    );
  }

  void onEnd() {
    if (index < Colors.primaries.length - 1 && onPress) {
      index++;
    } else {
      index = 0;
    }
    setState(() {});
  }
}