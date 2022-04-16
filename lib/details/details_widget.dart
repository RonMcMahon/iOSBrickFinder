import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../share/share_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    Key key,
    this.brickInscription,
  }) : super(key: key);

  final DocumentReference brickInscription;

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BricksRecord>(
      stream: BricksRecord.getDocument(widget.brickInscription),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCubeGrid(
                color: Color(0xFFB70606),
                size: 50,
              ),
            ),
          );
        }
        final detailsBricksRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
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
                child: AutoSizeText(
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: StreamBuilder<BricksRecord>(
                                  stream: BricksRecord.getDocument(
                                      widget.brickInscription),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitCubeGrid(
                                            color: Color(0xFFB70606),
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    final imageBricksRecord = snapshot.data;
                                    return Image.asset(
                                      'assets/images/BlankBrick.jpg',
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.03, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: StreamBuilder<List<BricksRecord>>(
                        stream: queryBricksRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitCubeGrid(
                                  color: Color(0xFFB70606),
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<BricksRecord> textBricksRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textBricksRecord =
                              textBricksRecordList.isNotEmpty
                                  ? textBricksRecordList.first
                                  : null;
                          return AutoSizeText(
                            detailsBricksRecord.inscription,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Latitude',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            detailsBricksRecord.latitude.toString(),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF151B1E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Longitude',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              detailsBricksRecord.longitude.toString(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF151B1E),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Key Brick 1',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: StreamBuilder<BricksRecord>(
                              stream: BricksRecord.getDocument(
                                  widget.brickInscription),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitCubeGrid(
                                        color: Color(0xFFB70606),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final textBricksRecord = snapshot.data;
                                return Text(
                                  detailsBricksRecord.between,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF151B1E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Key Brick 2',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: StreamBuilder<BricksRecord>(
                              stream: BricksRecord.getDocument(
                                  widget.brickInscription),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitCubeGrid(
                                        color: Color(0xFFB70606),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final textBricksRecord = snapshot.data;
                                return Text(
                                  detailsBricksRecord.located,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF151B1E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brick listed on Page in Official Brick Record',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 5),
                            child: StreamBuilder<BricksRecord>(
                              stream: BricksRecord.getDocument(
                                  widget.brickInscription),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitCubeGrid(
                                        color: Color(0xFFB70606),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final textBricksRecord = snapshot.data;
                                return Text(
                                  detailsBricksRecord.page.toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF151B1E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShareWidget(
                        passedInscription: '',
                        fullBrickRecord:
                            'I found the brick with the inscription ${detailsBricksRecord.inscription} in Olympic Plaza in Calgary! It is located at Latitude: ${detailsBricksRecord.latitude.toString()} and at Longitude: ${detailsBricksRecord.longitude.toString()} You can also find it between the Key Brick ${detailsBricksRecord.between} and ${detailsBricksRecord.located} Find your favorite bricks at Olympicbricks.com or download the App.',
                      ),
                    ),
                  );
                },
                text: 'Tell Others About This Brick',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: Color(0xFFB70606),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: FlutterFlowGoogleMap(
                    controller: googleMapsController,
                    onCameraIdle: (latLng) => googleMapsCenter = latLng,
                    initialLocation: googleMapsCenter ??=
                        LatLng(51.045855, -114.059452),
                    markers: [
                      if (detailsBricksRecord != null)
                        FlutterFlowMarker(
                          detailsBricksRecord.reference.path,
                          detailsBricksRecord.latLong,
                          () async {
                            await googleMapsController.future.then(
                              (c) => c.animateCamera(
                                CameraUpdate.newLatLng(
                                    detailsBricksRecord.latLong.toGoogleMaps()),
                              ),
                            );
                          },
                        ),
                    ],
                    markerColor: GoogleMarkerColor.red,
                    mapType: MapType.satellite,
                    style: GoogleMapStyle.standard,
                    initialZoom: 17,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: true,
                    showLocation: false,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await launchURL('https://algolia.com/about');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/Search_by_Algolia.JPG',
                    width: double.infinity,
                    height: 30,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
