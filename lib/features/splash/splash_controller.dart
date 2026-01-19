import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonus/core/controllers/app_controller.dart';
import 'package:sonus/core/helper/orientation_helper.dart';
import 'package:sonus/core/services/network_manager.dart';
import 'package:sonus/core/utils/theme_controller.dart';
import 'package:sonus/routhing/app_routes.dart';

class SplashController extends GetxController {
  final _appCtrl = Get.find<AppController>();
  final themeCtrl = Get.find<ThemeController>();
  final networkManager = Get.find<NetworkManager>();

  var isLoading = true.obs;
  var loadingText = 'Initializing...'.obs;
  var progress = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OrientationHelper.setOrientation(Get.context!);
    });

    _startInitialization();
  }

  Future<void> _startInitialization() async {
    try {
      _appCtrl.setup().timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          debugPrint('App setup timeout - continuing with offline mode');
        },
      ).catchError((e) {
        debugPrint('App setup error: $e');
      });

      await _performCriticalStartupTasks();
    } catch (e) {
      debugPrint('Initialization error: $e');
      await Future.delayed(const Duration(milliseconds: 500));
      _navigateToHome();
    }
  }

  Future<void> _performCriticalStartupTasks() async {
    _startBackgroundTasks();

    progress.value = 1.0;
    await Future.delayed(const Duration(milliseconds: 300));
    _navigateToHome();
  }

  Future<void> _startBackgroundTasks() async {
    Future.wait([
      _loadUserPreferences(),
    ]).catchError((e, stackTrace) {
      debugPrint('Background task error: $e');
      debugPrint('Stack trace: $stackTrace');
      return <void>[];
    });
  }

  Future<void> _loadUserPreferences() async {
    loadingText.value = 'Loading preferences...';
    try {
      _appCtrl.updateTheme();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? lastPlayedSong = prefs.getString('lastPlayedSong');

      debugPrint('Last played song: $lastPlayedSong');
    } catch (e) {
      debugPrint('Error loading preferences: $e');
    }
  }

  Future<void> _navigateToHome() async {
    Get.offAllNamed(Routes.HOME);
  }
}
