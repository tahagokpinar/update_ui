import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'update_controller.dart';
import 'build_button.dart';
import 'update_screen.dart';

class CheckForUpdatesScreen extends StatelessWidget {
  final UpdateController controller = Get.put(UpdateController());

  CheckForUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateScreen(
      title: 'Check for updates by clicking the button below:',
      icon: Icons.update,
      buttons: [
        GetBuilder<UpdateController>(
          builder: (controller) {
            return BuildButton(
              onPressed: controller.isCheckingForUpdates
                  ? () {}
                  : () {
                      controller.checkForUpdatesProcess();
                    },
              icon: Icons.refresh,
              label: controller.isCheckingForUpdates
                  ? "Checking for updates..."
                  : "Check for Updates",
            );
          }
        ),
      ],
    );
  }
}
