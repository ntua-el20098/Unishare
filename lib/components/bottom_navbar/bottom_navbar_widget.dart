import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_navbar_model.dart';
export 'bottom_navbar_model.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({
    Key? key,
    required this.selectedPageIndex,
  }) : super(key: key);

  final int? selectedPageIndex;

  @override
  _BottomNavbarWidgetState createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget>
    with TickerProviderStateMixin {
  late BottomNavbarModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'dividerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: Offset(0.6, 1.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: Offset(0.6, 1.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: Offset(0.6, 1.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: Offset(0.6, 1.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: Offset(0.6, 1.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavbarModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: (isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible) ==
              false
          ? true
          : false,
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          width: 372.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondary,
            ),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (currentUserEmail == 'koustenisch@gmail.com') {
                    context.pushNamed('adminHomePage');
                  } else {
                    context.pushNamed('UserHomePageSolved');
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 1 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 50.0,
                        hoverColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          FFIcons.khome,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (currentUserEmail == 'koustenisch@gmail.com') {
                            context.pushNamed(
                              'adminHomePage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            context.pushNamed(
                              'UserHomePageSolved',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        },
                      ),
                    ),
                    if (widget.selectedPageIndex == 1)
                      SizedBox(
                        width: 30.0,
                        child: Divider(
                          height: 2.0,
                          thickness: 2.0,
                          color: Colors.white,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['dividerOnPageLoadAnimation1']!),
                  ],
                ),
              ),
              if (currentUserEmail != 'koustenisch@gmail.com')
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 50.0,
                        hoverColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          FFIcons.kaward,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.goNamed(
                            'UserRewards',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                    if (widget.selectedPageIndex == 2)
                      SizedBox(
                        width: 30.0,
                        child: Divider(
                          height: 2.0,
                          thickness: 2.0,
                          color: Colors.white,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['dividerOnPageLoadAnimation2']!),
                  ],
                ),
              if (currentUserEmail != 'koustenisch@gmail.com')
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 3 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 50.0,
                        hoverColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'camera',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                    if (widget.selectedPageIndex == 3)
                      SizedBox(
                        width: 30.0,
                        child: Divider(
                          height: 2.0,
                          thickness: 2.0,
                          color: Colors.white,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['dividerOnPageLoadAnimation3']!),
                  ],
                ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: (widget.selectedPageIndex == 4) ||
                            (widget.selectedPageIndex == 14)
                        ? 1.0
                        : 0.5,
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 0.0,
                      buttonSize: 50.0,
                      hoverColor: FlutterFlowTheme.of(context).secondary,
                      icon: Icon(
                        FFIcons.khistory,
                        color: Colors.white,
                        size: 34.0,
                      ),
                      onPressed: () async {
                        if (currentUserEmail == 'koustenisch@gmail.com') {
                          context.pushNamed(
                            'AdminHistoryPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          context.pushNamed(
                            'UserPageUnsolved',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        }
                      },
                    ),
                  ),
                  if ((widget.selectedPageIndex == 4) ||
                      (widget.selectedPageIndex == 14))
                    SizedBox(
                      width: 30.0,
                      child: Divider(
                        height: 2.0,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['dividerOnPageLoadAnimation4']!),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: widget.selectedPageIndex == 5 ? 1.0 : 0.5,
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 0.0,
                      buttonSize: 50.0,
                      hoverColor: FlutterFlowTheme.of(context).secondary,
                      icon: Icon(
                        FFIcons.kaccountCircle,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.goNamed(
                          'UserProfile',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  ),
                  if (widget.selectedPageIndex == 5)
                    SizedBox(
                      width: 30.0,
                      child: Divider(
                        height: 2.0,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['dividerOnPageLoadAnimation5']!),
                ],
              ),
            ]
                .divide(SizedBox(width: 16.0))
                .addToStart(SizedBox(width: 16.0))
                .addToEnd(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}
