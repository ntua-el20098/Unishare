import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_model.dart';
export 'terms_model.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  _TermsWidgetState createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late TermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Terms of Service for UniShare',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w800,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 493.0,
                  height: 106.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        Color(0xD1FFFFFF)
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 20.0, 10.0, 20.0),
                            child: Text(
                              '\nEffective Date: 17/1/2024\n\nThank you for choosing UniShare! These Terms of Service (\"Terms\") outline the rules and regulations for the use of UniShare and its services.\n\nBy using UniShare, you agree to these Terms. If you do not agree with any part of these Terms, please do not use the app.\n\n**1. Acceptance of Terms**\n\nBy using UniShare, you acknowledge that you have read and understood these Terms and agree to be bound by them. These Terms may be updated from time to time, and it is your responsibility to review them periodically.\n\n**2. User Conduct**\n\nYou agree to use UniShare responsibly and in compliance with all applicable laws and regulations. In particular, you agree not to:\n\na. Violate any local, state, national, or international law or regulation.\nb. Infringe on the rights of others, including privacy and intellectual property rights.\nc. Post content that is harmful, offensive, obscene, or otherwise objectionable.\nd. Misrepresent your identity or affiliation with any person or entity.\ne. Engage in any activity that could harm, disable, or overburden the app.\n\n**3. Purpose of the App**\n\nUniShare is designed to facilitate the reporting and resolution of issues related to damaged property within the university campus. Users can capture and post photos of damaged property for the dean\'s attention. The app also allows users to view the status of reported issues, including before-and-after photos once the problem has been resolved.\n\n**4. User-Generated Content**\n\na. By posting photos and content on UniShare, you grant the app\'s administrators and the university the right to use, reproduce, modify, adapt, publish, translate, distribute, and display the content for the purpose of addressing and resolving the reported issues.\n\nb. You are solely responsible for the content you post on the app. Do not post any content that infringes on the rights of others or violates these Terms.\n\n**5. Privacy**\n\na. UniShare takes user privacy seriously. Please refer to our Privacy Policy for information on how we collect, use, and protect your personal information.\n\n**6. Termination of Service**\n\nUniShare reserves the right to terminate or suspend your access to the app at any time for violation of these Terms or for any other reason.\n\n**7. Changes to the Terms**\n\nUniShare reserves the right to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days\' notice before any new terms take effect. Your continued use of the app after the effective date of the revised Terms constitutes acceptance of the changes.\n\n**8. Contact Information**\n\nIf you have any questions or concerns about these Terms, please contact us at koustenisch@gmail.com.\n\nBy using UniShare, you agree to these Terms and the Privacy Policy. Thank you for being a responsible user!',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
