import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/material.dart';

class Updater {
  static check(BuildContext context) async {
    const appleId = '6483303093';
    const playStoreId = 'com.greenluck.greenluck';

    return AppVersionUpdate.checkForUpdates(
      appleId: appleId,
      playStoreId: playStoreId,
    ).then((data) async {
      print(data.storeUrl);
      print(data.storeVersion);
      if (data.canUpdate!) {
        AppVersionUpdate.showAlertUpdate(
          appVersionResult: data,
          context: context,
          mandatory: true,
        );
      }
    });
  }
}
