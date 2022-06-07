import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: ResponsiveWidget(),
  ));
}

class ResponsiveWidget extends StatefulWidget {
  const ResponsiveWidget({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(desktop: Menu_Web(), mobile: Menu_Tablet()));
  }
}

class ResponsiveWidget_Game extends StatefulWidget {
  const ResponsiveWidget_Game({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget_Game> createState() => _ResponsiveWidget_HomeState();
}

class _ResponsiveWidget_HomeState extends State<ResponsiveWidget_Game> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(desktop: Game_web(), mobile: Game_Tablet()));
  }
}

class ResponsiveWidget_Gameover extends StatefulWidget {
  const ResponsiveWidget_Gameover({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget_Gameover> createState() =>
      _ResponsiveWidget2_HomeState();
}

class _ResponsiveWidget2_HomeState extends State<ResponsiveWidget_Gameover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
            Layoutbuilder(desktop: Gameover_web(), mobile: Gameover_Tablet()));
  }
}

class ResponsiveWidget_Instructions extends StatefulWidget {
  const ResponsiveWidget_Instructions({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget_Instructions> createState() =>
      _Responsive_InstructionsState();
}

class _Responsive_InstructionsState
    extends State<ResponsiveWidget_Instructions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(
            desktop: Instruction_Landscape(), mobile: Instruction_Portrait()));
  }
}

class Layoutbuilder extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const Layoutbuilder({super.key, required this.desktop, required this.mobile});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 768) {
        return mobile;
      } else {
        return desktop;
      }
    }));
  }
}

class Game_web extends StatefulWidget {
  const Game_web({Key? key}) : super(key: key);

  @override
  State<Game_web> createState() => _HomeState();
}

class _HomeState extends State<Game_web> {
  int restricted = 0;
  int random = 0;
  int previous = 0;
  int score = 0;
  int guessed_card1 = 53;
  int guessed_card2 = 53;
  int guessed_card3 = 53;
  int guessed_card4 = 53;
  int guessed_card5 = 53;
  int future_value = 0;
  int previous_value = 0;
  callback(selector) async {
    await Future.delayed(const Duration(seconds: 2), () {
      previous = random;
      guessed_card1 = previous;
      setState(() {
        random = selector;
        restricted++;
      });
    });
  }

  callback1(previousval) async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        guessed_card2 = previousval;
      });
    });
  }

  callback2() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card3 = guessed_card2;
      });
    });
  }

  callback3() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card4 = guessed_card3;
      });
    });
  }

  callback4(previousval) {
    Future.delayed(const Duration(seconds: 0), () async {
      guessed_card5 = previousval;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('konoha.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 540,
                child: Image.asset(
                  'assets/$guessed_card5.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 420,
                child: Image.asset(
                  'assets/$guessed_card4.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 300,
                child: Image.asset(
                  'assets/$guessed_card3.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 180,
                child: Image.asset(
                  'assets/$guessed_card2.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 60,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                bottom: 120,
                left: 600,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 200,
                  height: 280,
                ),
              ),
              Positioned(
                bottom: 350,
                left: 1050,
                child: TextButton(
                  child: Text(
                    'HIGH',
                    style: TextStyle(
                        color: Colors.red, fontFamily: 'naruto', fontSize: 40),
                  ),
                  onPressed: () {
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);

                    if (previous_value <= future_value && restricted != 0) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 230,
                left: 1050,
                child: TextButton(
                  child: Text(
                    'LOW',
                    style: TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontFamily: 'naruto',
                        fontSize: 40),
                  ),
                  onPressed: () {
                    int guess = 0;
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);
                    if (previous_value > future_value) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                  bottom: 123,
                  left: 1050,
                  child: getpicture(
                    callback: callback,
                  )),
              Positioned(
                  bottom: 10,
                  left: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Score: $score',
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 48, 187),
                          fontFamily: 'naruto',
                          fontSize: 30),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class getpicture extends StatelessWidget {
  int selector = 0;

  final Function callback;
  getpicture({
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        selector = Random().nextInt(52);

        callback(selector);
      },
      child: Text(
        'REVEAL',
        style: TextStyle(
            color: Color.fromARGB(255, 224, 114, 11),
            fontFamily: 'naruto',
            fontSize: 40),
      ),
    );
  }
}

class Gameover_web extends StatefulWidget {
  const Gameover_web({Key? key}) : super(key: key);

  @override
  State<Gameover_web> createState() => _menuState();
}

class _menuState extends State<Gameover_web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('gameover_bg.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 800,
                bottom: 400,
                child: Text(
                  'GAMEOVER',
                  style: TextStyle(fontFamily: 'naruto', fontSize: 80),
                )),
            Positioned(
                left: 880,
                bottom: 300,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget_Game()));
                  },
                  child: Text(
                    'Try Again?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 111, 6),
                        fontFamily: 'naruto',
                        fontSize: 50),
                  ),
                )),
            Positioned(
                left: 950,
                bottom: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget()));
                  },
                  child: Text('Exit',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'naruto',
                          fontSize: 50)),
                ))
          ],
        ),
      ),
    );
  }
}

class Menu_Web extends StatefulWidget {
  const Menu_Web({Key? key}) : super(key: key);

  @override
  State<Menu_Web> createState() => _MenuState();
}

class _MenuState extends State<Menu_Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('menu_bg.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 210,
                bottom: 160,
                child: Image.asset(
                  'naruto_logo.png',
                  width: 600,
                  height: 500,
                )),
            Positioned(
              left: 410,
              bottom: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResponsiveWidget_Game()));
                },
                child: Text('Start',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'naruto',
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            Positioned(
                left: 370,
                bottom: 150,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResponsiveWidget_Instructions()));
                  },
                  child: Text('Instructions',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'naruto',
                          color: Color.fromARGB(255, 255, 255, 255))),
                )),
          ],
        ),
      ),
    );
  }
}

class Menu_Tablet extends StatefulWidget {
  const Menu_Tablet({Key? key}) : super(key: key);

  @override
  State<Menu_Tablet> createState() => _Menu2State();
}

class _Menu2State extends State<Menu_Tablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('menu_bg.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: -40,
                bottom: 160,
                child: Image.asset(
                  'naruto_logo.png',
                  width: 600,
                  height: 500,
                )),
            Positioned(
              left: 160,
              bottom: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResponsiveWidget_Game()));
                },
                child: Text('Start',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'naruto',
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            Positioned(
                left: 120,
                bottom: 140,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResponsiveWidget_Instructions()));
                  },
                  child: Text('Instructions',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'naruto',
                          color: Color.fromARGB(255, 255, 255, 255))),
                )),
          ],
        ),
      ),
    );
  }
}

class Game_Tablet extends StatefulWidget {
  const Game_Tablet({Key? key}) : super(key: key);

  @override
  State<Game_Tablet> createState() => _Home1State();
}

class _Home1State extends State<Game_Tablet> {
  int restricted = 0;
  int random = 0;
  int previous = 0;
  int score = 0;
  int guessed_card1 = 53;
  int guessed_card2 = 53;
  int guessed_card3 = 53;
  int guessed_card4 = 53;
  int guessed_card5 = 53;
  int future_value = 0;
  int previous_value = 0;
  callback(selector) async {
    await Future.delayed(const Duration(seconds: 2), () {
      previous = random;
      guessed_card1 = previous;
      setState(() {
        random = selector;
        restricted++;
      });
    });
  }

  callback1(previousval) async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        guessed_card2 = previousval;
      });
    });
  }

  callback2() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card3 = guessed_card2;
      });
    });
  }

  callback3() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card4 = guessed_card3;
      });
    });
  }

  callback4(previousval) {
    Future.delayed(const Duration(seconds: 0), () async {
      guessed_card5 = previousval;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('konoha.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 540,
                child: Image.asset(
                  'assets/$guessed_card5.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 420,
                child: Image.asset(
                  'assets/$guessed_card4.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 300,
                child: Image.asset(
                  'assets/$guessed_card3.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 180,
                child: Image.asset(
                  'assets/$guessed_card2.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                left: 60,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 100,
                  height: 250,
                ),
              ),
              Positioned(
                bottom: 120,
                left: 250,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 200,
                  height: 300,
                ),
              ),
              Positioned(
                bottom: 60,
                left: 80,
                child: TextButton(
                  child: Text(
                    'HIGH',
                    style: TextStyle(
                        color: Colors.red, fontFamily: 'naruto', fontSize: 40),
                  ),
                  onPressed: () {
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);

                    if (previous_value <= future_value && restricted != 0) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 60,
                left: 500,
                child: TextButton(
                  child: Text(
                    'LOW',
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 22, 22),
                        fontFamily: 'naruto',
                        fontSize: 40),
                  ),
                  onPressed: () {
                    int guess = 0;
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);
                    if (previous_value > future_value) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                  bottom: 60,
                  left: 270,
                  child: getpicture(
                    callback: callback,
                  )),
              Positioned(
                  bottom: 590,
                  left: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Score: $score',
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 48, 187),
                          fontFamily: 'naruto',
                          fontSize: 30),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Gameover_Tablet extends StatefulWidget {
  const Gameover_Tablet({Key? key}) : super(key: key);

  @override
  State<Gameover_Tablet> createState() => _menu2State();
}

class _menu2State extends State<Gameover_Tablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('gameover_bg.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 290,
                bottom: 400,
                child: Text(
                  'GAMEOVER',
                  style: TextStyle(fontFamily: 'naruto', fontSize: 80),
                )),
            Positioned(
                left: 350,
                bottom: 300,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget_Game()));
                  },
                  child: Text(
                    'Try Again?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 111, 6),
                        fontFamily: 'naruto',
                        fontSize: 50),
                  ),
                )),
            Positioned(
                left: 420,
                bottom: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget()));
                  },
                  child: Text('Exit',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'naruto',
                          fontSize: 50)),
                ))
          ],
        ),
      ),
    );
  }
}

class Instruction_Portrait extends StatefulWidget {
  const Instruction_Portrait({Key? key}) : super(key: key);

  @override
  State<Instruction_Portrait> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction_Portrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('menu_bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                  left: 10,
                  bottom: 400,
                  child: Text('first, click the reveal',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
              Positioned(
                  left: 10,
                  bottom: 370,
                  child: Text('then choose between HIGH or LOW and',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
              Positioned(
                  left: 10,
                  bottom: 340,
                  child: Text('repeat the process ',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
            ],
          )),
    );
  }
}

class Instruction_Landscape extends StatefulWidget {
  const Instruction_Landscape({Key? key}) : super(key: key);

  @override
  State<Instruction_Landscape> createState() => _Instruction2State();
}

class _Instruction2State extends State<Instruction_Landscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('menu_bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                  left: 30,
                  bottom: 400,
                  child: Text(
                      'first, click the reveal button then choose between HIGH or LOW and',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
              Positioned(
                  left: 30,
                  bottom: 360,
                  child: Text('repeat the process ',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
            ],
          )),
    );
  }
}
