import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLatLngFromMapProvider extends ChangeNotifier {
  double? _lat;

  double? get lat => _lat;

  double? _lon;

  double? get lon => _lon;

  void setLocation(LatLng location) {
    _lat = location.latitude;
    _lon = location.longitude;

    notifyListeners();
  }

  void clearLocation() {
    _lat = null;
    _lon = null;

    notifyListeners();
  }
}
