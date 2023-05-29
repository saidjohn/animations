import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomPage(),
    );
  }
}

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> with SingleTickerProviderStateMixin {
  late AnimationController _animatedContainer;
  late final _animation;

  @override
  void initState() {
    super.initState();
    _animatedContainer =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation =
        CurvedAnimation(parent: _animatedContainer, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    _animatedContainer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const SizedBox(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage('assets/images/img.png'),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.play_circle),
        onPressed: () {
          _animatedContainer.forward();
        },
      ),
    );
  }
}
