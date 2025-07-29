import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/detail/widgets/address_displayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class AppMap extends StatefulWidget {
  final Story story;

  const AppMap({super.key, required this.story});

  @override
  State<AppMap> createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  final Set<Marker> markers = {};
  late GoogleMapController mapController;
  late LatLng location;
  geo.Placemark? placemark;

  @override
  void initState() {
    super.initState();
    location = LatLng(
      widget.story.lat ?? -7.456154,
      widget.story.lon ?? 112.425206,
    );
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: location,
      onTap: () {
        mapController.animateCamera(CameraUpdate.newLatLngZoom(location, 18));
      },
    );
    markers.add(marker);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.story.lat == null || widget.story.lon == null) {
      return Center(child: Text("Sorry, can't display maps due to null value"));
    }
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          onMapCreated: _onMapCreated,
          onLongPress: _onLongPressedGoogleMap,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.story.lat ?? -7.456154,
              widget.story.lon ?? 112.425206,
            ),
            zoom: 18,
          ),
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          myLocationEnabled: true,
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Column(
            children: [
              FloatingActionButton.small(
                heroTag: "zoom-in",
                onPressed: () {
                  mapController.animateCamera(CameraUpdate.zoomIn());
                },
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 20),
              FloatingActionButton.small(
                heroTag: "zoom-out",
                onPressed: () {
                  mapController.animateCamera(CameraUpdate.zoomOut());
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: _onCurrentMarkerPressed,
            child: const Icon(Icons.my_location),
          ),
        ),
        if (placemark == null)
          const SizedBox()
        else
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: AddressDisplayer(placemark: placemark!),
          ),
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    final info = await geo.placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );
    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });
    _defineMarker(location, street, address);

    setState(() {
      mapController = controller;
    });
  }

  void _onCurrentMarkerPressed() async {
    final currentLocation = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await currentLocation.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await currentLocation.requestService();
      if (!serviceEnabled) {
        if (kDebugMode) {
          print("Location services is not available");
        }
        return;
      }
    }

    permissionGranted = await currentLocation.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await currentLocation.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        if (kDebugMode) {
          print("Location permission is denied");
        }
        return;
      }
    }

    locationData = await currentLocation.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    final place = info[0];

    final street = place.street;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    _defineMarker(latLng, street!, address);

    mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void _onLongPressedGoogleMap(LatLng latLng) async {
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );
    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });
    _defineMarker(latLng, street, address);

    mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void _defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(title: street, snippet: address),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}
