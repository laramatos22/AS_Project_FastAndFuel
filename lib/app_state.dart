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
    _valor = prefs.getDouble('ff_valor') ?? _valor;
  }

  SharedPreferences prefs;

  double quant = 0.0;

  double total = 0.0;

  double _valor = 0.0;
  double get valor => _valor;
  set valor(double _value) {
    _valor = _value;
    prefs.setDouble('ff_valor', _value);
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
