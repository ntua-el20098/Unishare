import '/backend/backend.dart';
import '/components/bottom_navbar/bottom_navbar_widget.dart';
import '/components/chips/chips_widget.dart';
import '/components/text_for_empty_solved_problems/text_for_empty_solved_problems_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_history_page_widget.dart' show AdminHistoryPageWidget;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdminHistoryPageModel extends FlutterFlowModel<AdminHistoryPageWidget> {
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
