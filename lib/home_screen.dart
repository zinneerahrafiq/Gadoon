// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
// // const double geofenceCenterLatitude = 37.7749;
// // const double geofenceCenterLongitude = -122.4194;
// const double geofenceCenterLatitude = 24.8721135;
// const double geofenceCenterLongitude = 67.0892254;
// const double geofenceRadius = 1.0;
//
//
// class _HomeScreenState extends State<HomeScreen> {
//   String _currentLocation = 'Unknown';
//
//   bool isWithinGeofence = false;
//
//   Timer? geofenceTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchLocation();
//     _verifyGeofence();
//     startGeofenceTimer();
//   }
//
//   // StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
//   //     locationSettings: locationSettings).listen((Position position) {
//   //   print(position.longitude); //Output: 80.24599079
//   //   print(position.latitude); //Output: 29.6593457
//   //
//   //   long = position.longitude.toString();
//   //   lat = position.latitude.toString();
//   //
//   //   setState(() {
//   //     //refresh UI on update
//   //   });
//   // });
//
//   void dispose() {
//     geofenceTimer?.cancel();
//     super.dispose();
//   }
//
//   void startGeofenceTimer() {
//     const duration = Duration(seconds: 10);
//     geofenceTimer = Timer.periodic(duration, (_) {
//       _verifyGeofence();
//     });
//   }
//   void _verifyGeofence() async {
//
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//
//     _currentLocation =
//     'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
//
//     double? longitude = position.longitude;
//     double? latitude = position.latitude;
//
//     if (latitude != null && longitude != null) {
//       print('Current Locationnn: Latitude $latitude, Longitude $longitude');
//
//       double distance = calculateDistance(
//         latitude,
//         longitude,
//         geofenceCenterLatitude,
//         geofenceCenterLongitude,
//       );
//
//       if (distance <= geofenceRadius) {
//         setState(() {
//           isWithinGeofence = true;
//         });
//       } else {
//         setState(() {
//           isWithinGeofence = false;
//         });
//       }
//     } else {
//       print('Failed to retrieve location coordinates');
//     }
//   }
//
//   double calculateDistance(
//       double lat1,
//       double lon1,
//       double lat2,
//       double lon2,
//       ) {
//     const int radiusOfEarth = 6371;
//
//     double dLat = _degreesToRadians(lat2 - lat1);
//     double dLon = _degreesToRadians(lon2 - lon1);
//
//     double a = sin(dLat / 2) * sin(dLat / 2) +
//         cos(_degreesToRadians(lat1)) *
//             cos(_degreesToRadians(lat2)) *
//             sin(dLon / 2) *
//             sin(dLon / 2);
//     double c = 2 * asin(sqrt(a));
//
//     return radiusOfEarth * c;
//   }
//
//   double _degreesToRadians(double degrees) {
//     return degrees * (pi / 180);
//   }
//
//
//   Future<void> fetchLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       setState(() {
//         _currentLocation =
//         'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
//       });
//     } catch (e) {
//       setState(() {
//         _currentLocation = 'Error: ${e.toString()}';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gadoon Textiles'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: isWithinGeofence ? (){} : null,
//               child: const Text(
//                 'Mark your attendance',
//               ),
//
//             ),
//             SizedBox(height:20),
//
//             Text(
//               'Current Location:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _currentLocation,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// const double geofenceCenterLatitude = 24.8721135;
// const double geofenceCenterLongitude = 67.0892254;
// const double geofenceRadius = 5;
//
// class _HomeScreenState extends State<HomeScreen> {
//   StreamSubscription<Position>? positionStream;
//   String _currentLocation = 'Unknown';
//   bool isWithinGeofence = false;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchLocation();
//     startGeofenceStream();
//   }
//
//   void dispose() {
//     positionStream?.cancel();
//     super.dispose();
//   }
//
//   void startGeofenceStream() {
//     positionStream = Geolocator.getPositionStream(
//
//     ).listen((Position position) {
//       setState(() {
//         _currentLocation =
//         'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
//
//         print('Current Locationnn: Latitude: ${position.latitude}\nLongitude: ${position.longitude}');
//
//         double distance = calculateDistance(
//           position.latitude,
//           position.longitude,
//           geofenceCenterLatitude,
//           geofenceCenterLongitude,
//         );
//         isWithinGeofence = distance <= geofenceRadius;
//         print('Distance to Geofence Point: $distance meters');
//       });
//     });
//   }
//
//   double calculateDistance(
//       double lat1,
//       double lon1,
//       double lat2,
//       double lon2,
//       ) {
//     const int radiusOfEarth = 6371;
//
//     double dLat = degreesToRadians(lat2 - lat1);
//     double dLon = degreesToRadians(lon2 - lon1);
//
//     double a = sin(dLat / 2) * sin(dLat / 2) +
//         cos(degreesToRadians(lat1)) *
//             cos(degreesToRadians(lat2)) *
//             sin(dLon / 2) *
//             sin(dLon / 2);
//     double c = 2 * asin(sqrt(a));
//
//     return radiusOfEarth * c;
//
//   }
//
//   double degreesToRadians(double degrees) {
//     return degrees * (pi / 180);
//   }
//
//   Future<void> fetchLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       setState(() {
//         _currentLocation =
//         'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
//       });
//     } catch (e) {
//       setState(() {
//         _currentLocation = 'Error: ${e.toString()}';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gadoon Textiles'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: isWithinGeofence ? () {} : null,
//               child: const Text('Mark your attendance'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Current Location:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _currentLocation,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }

//==================LISTTT===============

import 'dart:async';
import 'dart:math';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
const double geofenceRadius = 0.1;


const double geofenceMinLatitude = 24.87170;
const double geofenceMaxLatitude = 24.87270;
const double geofenceMinLongitude = 67.08870;
const double geofenceMaxLongitude = 67.08970;



final List<GeofencePoint> geofencePoints = [
  GeofencePoint(24.8721135, 67.0892254),
  GeofencePoint(24.8720208, 67.0894530),
  GeofencePoint(24.8721397, 67.0893840),
  GeofencePoint(24.8720810, 67.0892958),
  GeofencePoint(24.8719742, 67.0893722),
  GeofencePoint(24.8720539, 67.0893692)
];

class GeofencePoint {
  final double latitude;
  final double longitude;

  GeofencePoint(this.latitude, this.longitude);
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  StreamSubscription<Position>? positionStream;
  String _currentLocation = 'Unknown';
  bool isWithinGeofence = false;
  String _deviceMAC = 'device MAC';
  String? _deviceId;


  @override
  void initState() {
    super.initState();
    fetchLocation();
    startGeofenceStream();

  }

  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  // void startGeofenceStream() {
  //   positionStream = Geolocator.getPositionStream().listen((Position position) {
  //     setState(() {
  //       _currentLocation =
  //       'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
  //
  //       print(
  //           'Current Location: Latitude: ${position.latitude}\nLongitude: ${position.longitude}');
  //
  //       // Check if the current location is within any of the geofences
  //       isWithinGeofence = checkIfWithinGeofence(position.latitude, position.longitude);
  //     });
  //   });
  // }

  void startGeofenceStream() {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentLocation =
        'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';

        print(
            'Current Location: Latitude: ${position.latitude}\nLongitude: ${position.longitude}');

        isWithinGeofence = checkGeofence(
          position.latitude,
          position.longitude,
        );
      });
    });
  }

  bool checkGeofence(double latitude, double longitude) {
    if(latitude >= geofenceMinLatitude &&
        latitude <= geofenceMaxLatitude &&
        longitude >= geofenceMinLongitude &&
        longitude <= geofenceMaxLongitude){
      print("within office range ");
    }else{
      print("not within office range");
    }
    return (latitude >= geofenceMinLatitude &&
        latitude <= geofenceMaxLatitude &&
        longitude >= geofenceMinLongitude &&
        longitude <= geofenceMaxLongitude);
  }

  void sendDataToAPI() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final url = 'http://172.6.6.119:9001/api/geo-tracking'; // Replace with your API endpoint URL

      final payload = {
        "device_id": "00-B0-D0-63-C2-22",
        "latitude": position.latitude.toString(),
        "longitude": position.longitude.toString(),
      };

      final response = await http.post(
        Uri.parse(url),
        body: payload,
      );

      if (response.statusCode == 200) {
        // Request successful
        print("success");
        showSnackbar('Posted successfully');
      } else {
        // Request failed
        print("failed");

        showSnackbar('Failed to post');
      }
    } catch (e) {
      print("hahah");
      showSnackbar('Error: $e');
    }
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }



  // bool checkIfWithinGeofence(double latitude, double longitude) {
  //   for (final point in geofencePoints) {
  //     double distance = calculateDistance(
  //       latitude,
  //       longitude,
  //       point.latitude,
  //       point.longitude,
  //     );
  //
  //     print('Distance to from ${point.latitude} , ${point.longitude} Geofence Point: $distance kilometers');
  //
  //     if (distance <= geofenceRadius) {
  //       print('this won $latitude , $longitude ');
  //       return true; // Current location is within a geofence
  //     }
  //   }
  //   return false; // Current location is outside all geofences
  // }

  // double calculateDistance(
  //     double lat1,
  //     double lon1,
  //     double lat2,
  //     double lon2,
  //     ) {
  //   const int radiusOfEarth = 6371;
  //
  //   double dLat = degreesToRadians(lat2 - lat1);
  //   double dLon = degreesToRadians(lon2 - lon1);
  //
  //   double a = sin(dLat / 2) * sin(dLat / 2) +
  //       cos(degreesToRadians(lat1)) *
  //           cos(degreesToRadians(lat2)) *
  //           sin(dLon / 2) *
  //           sin(dLon / 2);
  //   double c = 2 * asin(sqrt(a));
  //
  //   return radiusOfEarth * c;
  // }
  //
  // double degreesToRadians(double degrees) {
  //   return degrees * (pi / 180);
  // }

  Future<void> fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation =
        'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        _currentLocation = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldKey,
        child:
        Scaffold(
          appBar: AppBar(
            title: Text('Gadoon Textiles'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  // onPressed: isWithinGeofence ? () {} : null,
                  //onPressed: isWithinGeofence ? sendDataToAPI : null,
                  onPressed: sendDataToAPI,
                  child: const Text('Mark your attendance'),
                ),
                SizedBox(height: 20),
                Text(
                  'Current Location:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 16),
                Text(
                  _currentLocation,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Text(
                //   _deviceMAC,
                //   style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                // ),
                Text('Device ID: ${_deviceId ?? '-'}'),
              ],
            ),
          ),
        )
    );
  }
}

