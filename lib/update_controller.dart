import 'package:get/get.dart';

import 'loading_screen.dart';
import 'update_completed_screen.dart';

class UpdateController extends GetxController {
  final RxBool _isUpdateAvailable = false.obs;
  bool get isUpdateAvailable => _isUpdateAvailable.value;

  final Rx<int> _currentStep = 0.obs;
  int get currentStep => _currentStep.value;

  final RxBool _isUpdateComplete = false.obs;
  bool get isUpdateComplete => _isUpdateComplete.value;

  final RxBool _isCheckingForUpdates = false.obs;
  bool get isCheckingForUpdates => _isCheckingForUpdates.value;
  set isCheckingForUpdates(bool value) {
    _isCheckingForUpdates.value = value;
    update();
  }

  final RxBool _isDownloading = false.obs;
  bool get isDownloading => _isDownloading.value;
  set isDownloading(bool value) {
    _isDownloading.value = value;
    update();
  }

  Future<void> checkForUpdates() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    _isUpdateAvailable.value = true;
  }

  void checkForUpdatesProcess() {
    _isCheckingForUpdates.value = true;
    update();
    checkForUpdates().then((_) async {
      if (_isUpdateAvailable.value) {
        await Future.delayed(
          const Duration(seconds: 2),
        );
        Get.to(
          const LoadingScreen(),
        );
      } else {
        _isCheckingForUpdates.value = false;
      }
    });
  }

  Future<void> startUpdateProcess() async {
    for (int i = 0; i <= 4; i++) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      _currentStep.value = i;
      update();

      if (currentStep == 4) {
        await Future.delayed(
          const Duration(seconds: 2),
        );
        _isUpdateComplete.value = true;
        update();
        Get.off(
          () => const UpdateCompletedScreen(),
        );
      }
    }
  }
}
