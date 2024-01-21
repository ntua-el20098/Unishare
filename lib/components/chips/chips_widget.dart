import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chips_model.dart';
export 'chips_model.dart';

class ChipsWidget extends StatefulWidget {
  const ChipsWidget({Key? key}) : super(key: key);

  @override
  _ChipsWidgetState createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  late ChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChipsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: FlutterFlowChoiceChips(
        options: [
          ChipData('Plumbing', FontAwesomeIcons.tint),
          ChipData('Electrical', Icons.electric_bolt),
          ChipData('Heating/Cooling', Icons.heat_pump_outlined),
          ChipData('Network', Icons.network_check),
          ChipData('General building damages', FontAwesomeIcons.houseDamage)
        ],
        onChanged: (val) => setState(() => _model.choiceChipsValues = val),
        selectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
          iconColor: FlutterFlowTheme.of(context).primaryText,
          iconSize: 18.0,
          elevation: 4.0,
          borderRadius: BorderRadius.circular(16.0),
        ),
        unselectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).alternate,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          iconSize: 18.0,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(16.0),
        ),
        chipSpacing: 12.0,
        rowSpacing: 12.0,
        multiselect: true,
        initialized: _model.choiceChipsValues != null,
        alignment: WrapAlignment.spaceAround,
        controller: _model.choiceChipsValueController ??=
            FormFieldController<List<String>>(
          [],
        ),
        wrapped: true,
      ),
    );
  }
}
