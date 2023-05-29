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
  late final _animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animatedContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<Size>(
      begin: const Size(100, 100),
      end: const Size(200, 200),
    ).animate(
        CurvedAnimation(parent: _animatedContainer, curve: Curves.bounceIn));

    _animation2 = Tween(
      begin: 200.0,
      end: 120.0,
    ).animate(CurvedAnimation(
        parent: _animatedContainer,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn)));

    _animatedContainer.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animatedContainer.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animatedContainer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _animation2,
                builder: (cth, ch) => Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(top: _animation2.value),
                    child: const Icon(
                      Icons.sports_basketball_rounded,
                      size: 100,color: Colors.red,
                    )),
              ),
            ),
          ],
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
