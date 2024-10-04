import 'package:flutter/material.dart';
import 'package:update_ui/build_button.dart';
import 'package:update_ui/update_screen.dart';

class UpdateCompletedScreen extends StatelessWidget {
  const UpdateCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateScreen(
      title: 'Update Completed',
      icon: Icons.check_circle,
      buttons: [
        BuildButton(
          onPressed: () {},
          icon: Icons.replay,
          label: 'Reboot Now',
          color: Colors.greenAccent,
        ),
        BuildButton(
          onPressed: () {},
          icon: Icons.schedule,
          label: 'Reboot Later',
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
