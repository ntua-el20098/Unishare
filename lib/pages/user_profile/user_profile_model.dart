import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_navbar/bottom_navbar_widget.dart';
import '/components/light_dark_mode/light_dark_mode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for light_dark_mode component.
  late LightDarkModeModel lightDarkModeModel;
  // Model for bottomNavbar component.
  late BottomNavbarModel bottomNavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    lightDarkModeModel = createModel(context, () => LightDarkModeModel());
    bottomNavbarModel = createModel(context, () => BottomNavbarModel());
  }

  void dispose() {
    lightDarkModeModel.dispose();
    bottomNavbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
