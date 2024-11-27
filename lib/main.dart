import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

void main() {
  runApp(const FlipbookApp());
}

class FlipbookApp extends StatelessWidget {
  const FlipbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
          child: Column(
            children: [
              const AnimationWindow(),
              ActionButtonSection(),
              const ControllerSection(),
              const BottomSection()
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
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1
            )
          )
        ),
      ),
    );
  }
}

class ActionButtonSection extends StatefulWidget {
  //this will have a single child which can be selected,
  //so if another is selected it will collapse the prior one
  ActionButtonSection({super.key});

  final List<IconData> actionButtonIcons = [
    Symbols.brush,
    Symbols.edit,
    Symbols.ink_eraser,
    Symbols.abc,
    Symbols.select,
    Symbols.content_copy,
    Symbols.content_paste,
    Symbols.resize,
    Symbols.open_with,
    Symbols.rotate_right
  ];

  @override
  State<ActionButtonSection> createState() => _ActionButtonSectionState();
}

class _ActionButtonSectionState extends State<ActionButtonSection> {
  int activeButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: Iterable<int>.generate(widget.actionButtonIcons.length)
              .map((index) => GestureDetector(
                onTap: () {
                  setState(() {
                    activeButtonIndex = index;
                  });
                },
                child: ActionButton(
                  icon: widget.actionButtonIcons[index],
                  isSelected: activeButtonIndex == index,
                ),
              )
            ).toList(),
          ),
        )
      )
    );
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton({super.key, required this.icon, required this.isSelected});

  final IconData icon;
  final bool isSelected;

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: widget.isSelected ? Colors.amber[900] : null,
            child: Icon(
              widget.icon,
              fill: 1,
              size: 50,
              weight: 650,
              color: widget.isSelected ? Colors.white : Colors.amber[900],
            ),
          )
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
          const Expanded(
            //left buttons section
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
          AspectRatio(
            //touchpad
            aspectRatio: 1 / 1,
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
      height: 90,
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
