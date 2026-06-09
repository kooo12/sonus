import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velo/core/services/audio_service.dart';
import 'package:velo/routhing/app_routes.dart';
import 'package:velo/core/services/fcm_service.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxBool hasSkippedPermissions = false.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  Future<void> requestMusicPermission() async {
    final audioService = Get.find<AudioPlayerService>();
    await audioService.checkPermissions();

    final status = await Permission.notification.status;
    if (status.isGranted) {
      finishOnboarding();
    } else {
      nextPage();
    }
  }

  Future<void> requestNotificationPermission() async {
    final fcmService = Get.find<FCMService>();
    await fcmService.requestPermission();
    nextPage();
  }

  Future<void> skipPermission() async {
    hasSkippedPermissions.value = true;
    
    if (currentPage.value == 1) {
      final status = await Permission.notification.status;
      if (status.isGranted) {
        finishOnboarding();
      } else {
        nextPage();
      }
    } else {
      nextPage();
    }
  }

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    Get.offAllNamed(Routes.HOME);
  }
}
