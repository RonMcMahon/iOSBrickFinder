// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter/services.dart';

Future copyText(String passedText) async {
  // Add your function code here!
  Clipboard.setData(ClipboardData(text: passedText));
}
