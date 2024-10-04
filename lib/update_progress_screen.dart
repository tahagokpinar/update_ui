import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:update_ui/app_bar_builder.dart';
import 'update_controller.dart';

class UpdateProgressScreen extends StatelessWidget {
  const UpdateProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateController controller = Get.put(UpdateController());

    controller.startUpdateProcess();

    return Scaffold(
      appBar: const AppBarBuilder(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<UpdateController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    bool isCompleted = index < controller.currentStep;
                    bool isActive = index == controller.currentStep;
                    IconData icon;

                    switch (index) {
                      case 0:
                        icon = Icons.check_circle;
                        break;
                      case 1:
                        icon = Icons.cloud_download;
                        break;
                      case 2:
                        icon = Icons.archive;
                        break;
                      case 3:
                        icon = Icons.cleaning_services;
                        break;
                      case 4:
                        icon = Icons.check_circle;
                        break;
                      default:
                        icon = Icons.check_circle; 
                    }

                    return Icon(
                      icon,
                      size: 40,
                      color: isCompleted
                          ? Colors.greenAccent
                          : (isActive ? Colors.blueAccent : Colors.grey),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                Text(
                  _getStepText(controller.currentStep),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 20,
                  width: 300,
                  child: LinearProgressIndicator(
                    value: (controller.currentStep + 1) / 4,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getStepText(int currentStep) {
    switch (currentStep) {
      case 0:
        return "Preparing...";
      case 1:
        return "Downloading...";
      case 2:
        return "Extracting...";
      case 3:
        return "Performing Cleanup...";
      case 4:
        return "Update Completed";
      default:
        return "Update Complete";
    }
  }
}
