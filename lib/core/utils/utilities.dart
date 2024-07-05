import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchPhone(String phoneNumber) async {
  List<String> parts = phoneNumber.split(" ");
  String mainNumber = parts[0];
  final Uri url = Uri.parse('tel:$mainNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $mainNumber';
  }
}

bool checkIfSiteIsOpen(String openTime, String closeTime) {
  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay open = _parseTime(openTime);
  TimeOfDay close = _parseTime(closeTime);
  return _isTimeWithinRange(currentTime, open, close);
}

TimeOfDay _parseTime(String time) {
  final format = DateFormat.Hms(); // Format: "HH:mm:ss"
  DateTime parsedTime = format.parse(time);
  return TimeOfDay(hour: parsedTime.hour, minute: parsedTime.minute);
}

bool _isTimeWithinRange(
    TimeOfDay currentTime, TimeOfDay startTime, TimeOfDay endTime) {
  final now = DateTime.now();
  DateTime currentDateTime = DateTime(
      now.year, now.month, now.day, currentTime.hour, currentTime.minute);
  DateTime startDateTime =
      DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute);
  DateTime endDateTime =
      DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

  return currentDateTime.isAfter(startDateTime) &&
      currentDateTime.isBefore(endDateTime);
}

String convertDateFormat(String timeString) {
  DateTime time = DateFormat("HH:mm:ss").parse(timeString);
  String formattedTime = DateFormat("HH.mm").format(time);
  return formattedTime;
}

double calculateDistance({
  required double originLat,
  required double originLong,
  required double detinationLat,
  required double destinationLong,
}) {
  const R = 6371; // Radius of the Earth in km
  double dLat = _deg2rad(detinationLat - originLat);
  double dLon = _deg2rad(destinationLong - originLong);
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_deg2rad(originLat)) * cos(_deg2rad(detinationLat)) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * asin(sqrt(a));
  return R * c;
}

double _deg2rad(double deg) {
  return deg * (pi / 180);
}
