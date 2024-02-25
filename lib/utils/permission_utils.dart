import 'package:permission_handler/permission_handler.dart';

Future<void> askForPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
  ].request();
}

Future<bool> isCameraPermissionChecked() async {
  bool status = await Permission.camera.status.isGranted;
  return status;
}

Future<bool> checkCameraPermission() async {
  bool cameraPermissionChecked = await isCameraPermissionChecked();
  if (!cameraPermissionChecked) {
    await openAppSettings();
  }
  return cameraPermissionChecked;
}
