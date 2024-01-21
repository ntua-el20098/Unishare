import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/bottom_navbar/bottom_navbar_widget.dart';
import '/components/chips/chips_widget.dart';
import '/components/text_for_empty_problems/text_for_empty_problems_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_home_page_widget.dart' show AdminHomePageWidget;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdminHomePageModel extends FlutterFlowModel<AdminHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for chips component.
  late ChipsModel chipsModel;
  // Model for bottomNavbar component.
  late BottomNavbarModel bottomNavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chipsModel = createModel(context, () => ChipsModel());
    bottomNavbarModel = createModel(context, () => BottomNavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    chipsModel.dispose();
    bottomNavbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
