import 'package:flutter/material.dart';

class PhysicsGame extends StatefulWidget {
  const PhysicsGame({super.key});

  @override
  State<PhysicsGame> createState() => _PhysicsGameState();
}

class _PhysicsGameState extends State<PhysicsGame> {
  bool isBlue = true;
  bool isRed = true;
  bool isGreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title:  Text('Physics Game',textAlign:TextAlign.center ,)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Draggable<Color>(
                data: Colors.blue,
                feedback: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                childWhenDragging: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    shape: BoxShape.circle,
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Draggable<Color>(
                data: Colors.red,
                feedback: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                childWhenDragging: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    shape: BoxShape.circle,
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Draggable<Color>(
                data: Colors.green,
                feedback: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                childWhenDragging: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.circle,
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DragTarget<Color>(
                builder: (context, accepted, rejected) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isBlue ? Colors.blue[100] : Colors.blue,
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 5, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  );
                },
                onWillAcceptWithDetails: (details) {
                  return details.data == Colors.blue;
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    isBlue = false;
                  });
                },
              ),
              DragTarget<Color>(
                builder: (context, accepted, rejected) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isRed ? Colors.red[100] : Colors.red,
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 5, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  );
                },
                onWillAcceptWithDetails: (details) {
                  return details.data == Colors.red;
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    isRed = false;
                  });
                },
              ),
              DragTarget<Color>(
                builder: (context, accepted, rejected) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isGreen ? Colors.green[100] : Colors.green,
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 5, color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  );
                },
                onWillAcceptWithDetails: (details) {
                  return details.data == Colors.green;
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    isGreen = false;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
