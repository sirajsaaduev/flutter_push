import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BodyPart? defendingBodyPart;
  BodyPart? attackingBodyPart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(213, 222, 240, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              SizedBox(
                width: 16,
              ),
              Expanded(child: Center(child: Text("You"))),
              SizedBox(
                width: 11,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(child: Center(child: Text("Enemy"))),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          const Life(),
          const SizedBox(
            height: 4,
          ),
          const Life(),
          const SizedBox(
            height: 4,
          ),
          const Life(),
          const SizedBox(
            height: 4,
          ),
          const Life(),
          const SizedBox(
            height: 4,
          ),
          const Life(),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Defend".toUpperCase()),
                    const SizedBox(
                      height: 13,
                    ),
                    BodyPartButton(
                        bodyPart: BodyPart.head,
                        selected: defendingBodyPart == BodyPart.head,
                        bodyPartSetter: _selectDefendingBodyPart),
                    const SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                        bodyPart: BodyPart.torso,
                        selected: defendingBodyPart == BodyPart.torso,
                        bodyPartSetter: _selectDefendingBodyPart),
                    const SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                        bodyPart: BodyPart.legs,
                        selected: defendingBodyPart == BodyPart.legs,
                        bodyPartSetter: _selectDefendingBodyPart),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Attack".toUpperCase()),
                    const SizedBox(
                      height: 13,
                    ),
                    BodyPartButton(
                        bodyPart: BodyPart.head,
                        selected: attackingBodyPart == BodyPart.head,
                        bodyPartSetter: _selectAttackingBodyPart),
                    const SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                        bodyPart: BodyPart.torso,
                        selected: attackingBodyPart == BodyPart.torso,
                        bodyPartSetter: _selectAttackingBodyPart),
                    const SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                        bodyPart: BodyPart.legs,
                        selected: attackingBodyPart == BodyPart.legs,
                        bodyPartSetter: _selectAttackingBodyPart),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
      Row(
        children: [
          const SizedBox(
            width: 16,
          ),

          Expanded(

            child: GestureDetector(
              onTap: () =>
                  defendingBodyPart != null && attackingBodyPart != null
                  ? nonSelected()
                  : Colors.black38,

              child: SizedBox(
                height: 40,
                child: ColoredBox(
                  color:
                  defendingBodyPart != null && attackingBodyPart != null
                      ? Colors.black87
                      : Colors.black38,
                  child: Center(
                    child: Text(
                      "Go".toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  void nonSelected() {
    setState(() {
      defendingBodyPart = null;
      attackingBodyPart = null;
    });
  }

  void _selectDefendingBodyPart(final BodyPart value) {
    setState(() {
      defendingBodyPart = value;
    });
  }

  void _selectAttackingBodyPart(final BodyPart value) {
    setState(() {
      attackingBodyPart = value;
    });
  }
}

class BodyPart {
  final String name;

  const BodyPart._(this.name);

  static const head = BodyPart._("Head");
  static const torso = BodyPart._("Torso");
  static const legs = BodyPart._("Legs");

  @override
  String toString() {
    return 'BodyPart{name: $name}';
  }
}

class BodyPartButton extends StatelessWidget {
  final BodyPart bodyPart;
  final bool selected;
  final ValueSetter<BodyPart> bodyPartSetter;

  const BodyPartButton({
    Key? key,
    required this.bodyPart,
    required this.selected,
    required this.bodyPartSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bodyPartSetter(bodyPart),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
          color: selected
              ? const Color.fromRGBO(28, 121, 206, 1.0)
              : Colors.black38,
          child: Center(child: Text(bodyPart.name.toUpperCase())),
        ),
      ),
    );
  }
}

class Life extends StatelessWidget {
  const Life({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(21, 22, 22, 1)),
                ),
              ),
            ),
            SizedBox(
              width: 11,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(21, 22, 22, 1)),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ],
    );
  }
}

