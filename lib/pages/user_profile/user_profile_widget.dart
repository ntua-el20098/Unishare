import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_navbar/bottom_navbar_widget.dart';
import '/components/light_dark_mode/light_dark_mode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: false,
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.0, -0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 11.0, 0.0),
                      child: Icon(
                        FFIcons.klogo,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'NicoMoji',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4.0,
          )
        ],
        body: Builder(
          builder: (context) {
            return SafeArea(
              top: false,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 40.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Profile image'),
                                                    content: Text(
                                                        'Do you want to upload a Profile image?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        final selectedMedia = await selectMedia(
                                          mediaSource: MediaSource.photoGallery,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          photoUrl: _model.uploadedFileUrl,
                                        ));
                                        return;
                                      } else {
                                        return;
                                      }
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'data:image/png;base64,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',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: wrapWithModel(
                                            model: _model.lightDarkModeModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LightDarkModeWidget(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            currentUserEmail,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xB4FFFFFF),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('terms');
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 0.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 4.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terms of Services',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 40.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  'Authentication', context.mounted);
                            },
                            text: 'Log Out',
                            options: FFButtonOptions(
                              width: 110.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context).bodyLarge,
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.bottomNavbarModel,
                      updateCallback: () => setState(() {}),
                      child: BottomNavbarWidget(
                        selectedPageIndex: 5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
