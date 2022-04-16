import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _selectedInscription =
        prefs.getString('ff_selectedInscription') ?? _selectedInscription;
    _selectedLocation =
        prefs.getString('ff_selectedLocation') ?? _selectedLocation;
    _selectedBetween =
        prefs.getString('ff_selectedBetween') ?? _selectedBetween;
    _selectedLatitude =
        prefs.getString('ff_selectedLatitude') ?? _selectedLatitude;
    _selectedLongitude =
        prefs.getString('ff_selectedLongitude') ?? _selectedLongitude;
    _selectedPage = prefs.getString('ff_selectedPage') ?? _selectedPage;
    _selectedLatLong = _latLngFromString(prefs.getString('ff_selectedLatLong'));
  }

  SharedPreferences prefs;

  String _selectedInscription = '';
  String get selectedInscription => _selectedInscription;
  set selectedInscription(String _value) {
    _selectedInscription = _value;
    prefs.setString('ff_selectedInscription', _value);
  }

  String _selectedLocation = '';
  String get selectedLocation => _selectedLocation;
  set selectedLocation(String _value) {
    _selectedLocation = _value;
    prefs.setString('ff_selectedLocation', _value);
  }

  String _selectedBetween = '';
  String get selectedBetween => _selectedBetween;
  set selectedBetween(String _value) {
    _selectedBetween = _value;
    prefs.setString('ff_selectedBetween', _value);
  }

  String _selectedLatitude = '';
  String get selectedLatitude => _selectedLatitude;
  set selectedLatitude(String _value) {
    _selectedLatitude = _value;
    prefs.setString('ff_selectedLatitude', _value);
  }

  String _selectedLongitude = '';
  String get selectedLongitude => _selectedLongitude;
  set selectedLongitude(String _value) {
    _selectedLongitude = _value;
    prefs.setString('ff_selectedLongitude', _value);
  }

  String _selectedPage = '';
  String get selectedPage => _selectedPage;
  set selectedPage(String _value) {
    _selectedPage = _value;
    prefs.setString('ff_selectedPage', _value);
  }

  LatLng _selectedLatLong;
  LatLng get selectedLatLong => _selectedLatLong;
  set selectedLatLong(LatLng _value) {
    _selectedLatLong = _value;
    prefs.setString('ff_selectedLatLong', _value.serialize());
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
