// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:workmanager/workmanager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';

Future backgroundTaskManger() async {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  Workmanager().executeTask((task, dataInputs) async {
    try {
      print("radiusWorkManager: Start periodic task");

      print("radiusWorkManager: Getting current position...");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true);

      print("radiusWorkManager: Save new position to DB...");
      await Firebase.initializeApp();

      final user = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: dataInputs!['email'])
          .where('location_on', isEqualTo: true)
          .get()
          .then((QuerySnapshot snapshot) {
        return snapshot.docs[0].reference;
      });

      user.update({
        'location': GeoPoint(position.latitude, position.longitude),
        'location_timestamp': DateTime.now()
      });
    } catch (err) {
      print("radiusWorkManager: Error");
      print(err);
    }

    print("radiusWorkManager: Completed task");
    return Future.value(true);
  });
}
