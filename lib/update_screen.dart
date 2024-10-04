import 'package:flutter/material.dart';
import 'package:update_ui/app_bar_builder.dart';

class UpdateScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget>? buttons;
  final String? description;

  const UpdateScreen({
    Key? key,
    required this.title,
    required this.icon,
    this.buttons,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBuilder(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 120,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buttons ?? [],
                ),
                const SizedBox(height: 20),
                if (description != null)
                  Text(
                    description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
