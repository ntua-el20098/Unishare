import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_navbar/bottom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'user_rewards_widget.dart' show UserRewardsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserRewardsModel extends FlutterFlowModel<UserRewardsWidget> {
  ///  Local state fields for this page.

  int? electricalcount = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bottomNavbar component.
  late BottomNavbarModel bottomNavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottomNavbarModel = createModel(context, () => BottomNavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    bottomNavbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
