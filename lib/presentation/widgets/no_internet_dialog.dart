import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetDialog {
  static void show() {
    Get.dialog(
      AlertDialog(
        title: const Text('No Internet'),
        content: const Text(
            'No internet connection. Please check your connection and try again.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
