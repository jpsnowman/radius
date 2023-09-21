// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;

class RadiusMap extends StatefulWidget {
  const RadiusMap({
    Key? key,
    this.width,
    this.height,
    required this.authUserEmail,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String authUserEmail;

  @override
  _RadiusMapState createState() => _RadiusMapState();
}

class _RadiusMapState extends State<RadiusMap> {
  late GoogleMapController mapController;
  late latlng.LatLng focusedLocation;
  bool init = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    init = true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          print("RadiusMap: Start building...");

          Set<Marker> _markers = {};
          focusedLocation = latlng.LatLng(0, 0);
          var items = snapshot.data?.docs ?? [];

          String focusUserEmail = widget.authUserEmail;
          double defaultZoom = 11;
          items.forEach((user) {
            if (user["email"] == widget.authUserEmail) {
              print("RadiusMap: Found auth user");

              focusUserEmail = user["focus_user"];
              defaultZoom = user["location_default_zoom"].toDouble();

              if (defaultZoom == 0) defaultZoom = 11;
            }
          });

          items.forEach((user) {
            MarkerId markerId = MarkerId(user["email"]);
            double hue = colorNameToHue(user["location_pin_color"]);

            if (user["email"] == focusUserEmail) {
              print("RadiusMap: Found focus user");
              focusedLocation = latlng.LatLng(
                  user["location"].latitude, user["location"].longitude);
            }

            DateTime dt = user["location_timestamp"].toDate();

            _markers.add(Marker(
              markerId: markerId,
              infoWindow: InfoWindow(
                  title: user["first_name"] + " " + user["last_name"],
                  snippet: convertDateToAgo(dt)),
              icon: BitmapDescriptor.defaultMarkerWithHue(hue),
              position: latlng.LatLng(
                  user["location"].latitude, user["location"].longitude),
            ));
          });

          CameraPosition focusedPosition =
              CameraPosition(target: focusedLocation, zoom: defaultZoom);

          if (init && focusedLocation.latitude != 0) {
            print("RadiusMap: Pointing camera to focus user");

            mapController
                .animateCamera(CameraUpdate.newCameraPosition(focusedPosition));
          }

          print("RadiusMap: Build complete");
          return Container(
              height: widget.height,
              width: widget.width,
              child: GoogleMap(
                  markers: Set<Marker>.from(_markers),
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: focusedPosition,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true));
        } else {
          return Container();
        }
      },
    );
  }
}
