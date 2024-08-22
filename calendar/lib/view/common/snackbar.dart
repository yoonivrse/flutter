import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void showError(String message) {
  if (Get.isOverlaysOpen) return;
  Get.snackbar(
    '',
    '',
    titleText: const Text('문제가 발생했어요.', style: TextStyle(color: Colors.white, fontSize: 16)),
    margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
    messageText: Text(message, style: const TextStyle(color: Colors.white, fontSize: 12)),
    backgroundColor: Colors.black54,
    borderRadius: 4,
  );
}