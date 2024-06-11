import 'package:flutter/material.dart';
import 'package:overlay_progress_indicator/overlay_progress_indicator.dart';

import 'loader/index.dart';

class ProgressService {
  static Future<void> show(BuildContext context) {
    return OverlayProgressIndicator.show(
      context: context,
      child: const Loader(),
    );
  }

  static Future<void> hide() {
    return OverlayProgressIndicator.hide();
  }
}
