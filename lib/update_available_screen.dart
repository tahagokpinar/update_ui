import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:update_ui/update_screen.dart';

import 'build_button.dart';
import 'check_for_updates.dart';
import 'update_controller.dart';
import 'update_progress_screen.dart';

class UpdateAvailableScreen extends StatelessWidget {
  final UpdateController controller = Get.put(UpdateController());

  UpdateAvailableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateScreen(
      title: 'Update Available',
      icon: Icons.download,
      buttons: [
        BuildButton(
          onPressed: () {
            controller.isCheckingForUpdates = false;
            Get.off(
              CheckForUpdatesScreen(),
            );
          },
          icon: Icons.cancel,
          label: "Cancel",
          color: Colors.redAccent,
        ),
        GetBuilder<UpdateController>(
          builder: (controller) {
            return BuildButton(
              onPressed: controller.isDownloading
                  ? () {}
                  : () {
                      controller.isDownloading = true;
                      Future.delayed(const Duration(seconds: 2), () {
                        Get.to(const UpdateProgressScreen());
                      });
                    },
              icon: Icons.download,
              label: controller.isDownloading ? "Downloading..." : "Download",
              color: Colors.greenAccent,
            );
          },
        ),
      ],
    );
  }
}
