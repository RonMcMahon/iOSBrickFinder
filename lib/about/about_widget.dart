import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key key}) : super(key: key);

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 1000,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color(0xFFB70606),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'HomePage'),
                ),
              );
            },
          ),
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
            child: Text(
              'Olympic Brick Finder',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFFE0F2F1),
                    fontSize: 30,
                  ),
            ),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFF1E2429),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x8AB69696), Color(0xFC382222)],
              stops: [0, 1],
              begin: AlignmentDirectional(1, -1),
              end: AlignmentDirectional(-1, 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/202x202.png',
                width: MediaQuery.of(context).size.width * 0.45,
                fit: BoxFit.fitHeight,
              ).animated([animationsMap['imageOnPageLoadAnimation']]),
              AutoSizeText(
                'About Olympic Brick Finder',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFE0F2F1),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 5, 6, 0),
                child: AutoSizeText(
                  'Welcome to the \'88 Olympics Brick Finder.  This is the ONLY digital database of Calgary\'s Olympic Plaza bricks. Each of the 36,000+ bricks in the plaza is locatable with your phone\'s GPS capability.  You can also use the original \'between these two key bricks\' locating method.\n\nThe database of bricks has been painstakingly regenerated from a 33-year-old mainframe printer record as no digital version remained.\n\nIf you happen to notice a mistake in our record, please let us know and we\'ll update our system.\n\nThanks for helping to keep Olympic Plaza and the bricks that are a key part of it an important part of Calgary\'s Olympic legacy!',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFE0F2F1),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation']]),
              ),
              InkWell(
                onTap: () async {
                  await launchURL('olympicbricks.com');
                },
                child: AutoSizeText(
                  'Visit us on the web at OLYMPICBRICKS.COM',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF80DEEA),
                        fontSize: 20,
                      ),
                ),
              ),
            ],
          ).animated([animationsMap['columnOnPageLoadAnimation']]),
        ).animated([animationsMap['containerOnPageLoadAnimation']]),
      ),
    );
  }
}
