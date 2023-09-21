import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Color colorNameToHex(String colorName) {
  double hue = 0;
  if (colorName == "Azure")
    hue = 210;
  else if (colorName == "Blue")
    hue = 240;
  else if (colorName == "Cyan")
    hue = 180;
  else if (colorName == "Green")
    hue = 120;
  else if (colorName == "Magenta")
    hue = 300;
  else if (colorName == "Orange")
    hue = 30;
  else if (colorName == "Red")
    hue = 0;
  else if (colorName == "Rose")
    hue = 330;
  else if (colorName == "Violet")
    hue = 270;
  else if (colorName == "Yellow") ;

  HSVColor c = HSVColor.fromAHSV(1, hue, 1, 1);
  return c.toColor();
}

double colorNameToHue(String colorName) {
  double hue = 0;
  if (colorName == "Azure")
    hue = 210;
  else if (colorName == "Blue")
    hue = 240;
  else if (colorName == "Cyan")
    hue = 180;
  else if (colorName == "Green")
    hue = 120;
  else if (colorName == "Magenta")
    hue = 300;
  else if (colorName == "Orange")
    hue = 30;
  else if (colorName == "Red")
    hue = 0;
  else if (colorName == "Rose")
    hue = 330;
  else if (colorName == "Violet")
    hue = 270;
  else if (colorName == "Yellow") hue = 60;

  return hue;
}

String convertDateToAgo(DateTime dateTime) {
  Duration diff = DateTime.now().difference(dateTime);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
  } else {
    return 'just now';
  }
}
