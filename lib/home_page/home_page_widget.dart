import '../backend/backend.dart';
import '../details/details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<BricksRecord> algoliaSearchResults = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: AutoSizeText(
            'Olympic Brick Finder',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFFE0F2F1),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0.25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -4.67),
                  child: TextFormField(
                    controller: textController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'textController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ENTER BRICK TO FIND',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB70606),
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB70606),
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      suffixIcon: textController.text.isNotEmpty
                          ? InkWell(
                              onTap: () => setState(
                                () => textController.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'IBM Plex Mono',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    setState(() => algoliaSearchResults = null);
                    await BricksRecord.search(
                      term: textController.text,
                    )
                        .then((r) => algoliaSearchResults = r)
                        .onError((_, __) => algoliaSearchResults = [])
                        .whenComplete(() => setState(() {}));
                  },
                  text: 'Search',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 24,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.11, -0.73),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Builder(
                            builder: (context) {
                              if (algoliaSearchResults == null) {
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
                              final listOfInscriptions =
                                  algoliaSearchResults?.toList() ?? [];
                              if (listOfInscriptions.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/NoMatchFound.jpg',
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listOfInscriptions.length,
                                itemBuilder:
                                    (context, listOfInscriptionsIndex) {
                                  final listOfInscriptionsItem =
                                      listOfInscriptions[
                                          listOfInscriptionsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
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
                                        List<BricksRecord>
                                            textBricksRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final textBricksRecord =
                                            textBricksRecordList.isNotEmpty
                                                ? textBricksRecordList.first
                                                : null;
                                        return InkWell(
                                          onTap: () async {
                                            setState(() => FFAppState()
                                                    .selectedInscription =
                                                listOfInscriptionsItem
                                                    .inscription);
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsWidget(
                                                  brickInscription:
                                                      listOfInscriptionsItem
                                                          .reference,
                                                ),
                                              ),
                                            );
                                          },
                                          child: AutoSizeText(
                                            listOfInscriptionsItem.inscription,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'IBM Plex Mono',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
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
          ),
        ),
      ),
    );
  }
}
