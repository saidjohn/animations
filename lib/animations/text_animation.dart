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
  late final _slideAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _opaciyAnimation;

  final AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animatedContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animatedContainer,
          curve: const Interval(0.0, 0.5, curve: Curves.bounceInOut)),
    );

    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
          parent: _animatedContainer,
          curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)),
    );

    _opaciyAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _animatedContainer,
          curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animatedContainer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 220,
          height: 100,
          margin: EdgeInsets.only(left: 75, top: _slideAnimation.value),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: Center(
              child: Text(
                'SAIDJON SAIDOV',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 128, _opaciyAnimation.value)),
              ),
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
