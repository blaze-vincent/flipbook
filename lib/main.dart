import 'package:flutter/material.dart';

void main() {
  runApp(const FlipbookApp());
}

class FlipbookApp extends StatelessWidget {
  const FlipbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AnimationWindow(),
              ActionButtonSection(
                actionButtons: [
                  ActionButton(),
                  ActionButton(),
                  ActionButton(),
                  ActionButton(),
                  ActionButton()
                ],
              ),
              ControllerSection(),
              BottomSection()
            ],
          ), 
        )
      ),
    );
  }
}

class AnimationWindow extends StatefulWidget {
  const AnimationWindow({super.key});

  @override
  State<AnimationWindow> createState() => _AnimationWindowState();
}

class _AnimationWindowState extends State<AnimationWindow> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        color: Colors.amber[300],
      ),  
    );
  }
}

class ActionButtonSection extends StatefulWidget {
  //this will have a single child which can be selected, so if another is selected it will collapse the prior one
  const ActionButtonSection({
    super.key, 
    required this.actionButtons  
  });

  final List<ActionButton> actionButtons;

  @override
  State<ActionButtonSection> createState() => _ActionButtonSectionState();
}

class _ActionButtonSectionState extends State<ActionButtonSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.actionButtons,
          ),
        )
      )
    );
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          //placeholder to display the container bounds
          color: Colors.amber,
        )
      )
    );
  }
}

class ControllerSection extends StatelessWidget {
  const ControllerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded( //left buttons section
            child: Column(
              children: [
                Expanded(
                  child: PlaceholderSquare(),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: PlaceholderSquare(),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: PlaceholderSquare(),
                ),
              ],
            ),
          ),
          
          AspectRatio( //touchpad
            aspectRatio: 1/1,
            child: Container(
              color: Colors.amberAccent,
            ),  
          )
        ],
      ),
    );
  }
}

//to be removed when the actual buttons are in place
class PlaceholderSquare extends StatelessWidget {
  const PlaceholderSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          color: Colors.amber,
        )
      );
  }
}

//rename
class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PlaceholderSquare(),
            PlaceholderSquare(),
            PlaceholderSquare()
          ],
        ),
      )
    );
  }
}