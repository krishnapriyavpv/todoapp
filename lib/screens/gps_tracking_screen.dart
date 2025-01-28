import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart'; // For mobile
import 'dart:html' as html; // For web

class GPSTrackingScreen extends StatefulWidget {
  @override
  _GPSTrackingScreenState createState() => _GPSTrackingScreenState();
}

class _GPSTrackingScreenState extends State<GPSTrackingScreen> {
  late Location location;
  LocationData? _currentLocation;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _getWebLocation(); // Web location fetching
    } else {
      location = Location();
      _getMobileLocation(); // Mobile location fetching
    }
  }

  // Function to request permission and get the current location for mobile
  Future<void> _getMobileLocation() async {
    // Request permission if not granted
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the current location
    LocationData _locationData = await location.getLocation();
    setState(() {
      _currentLocation = _locationData;
      _loading = false; // Hide loading after location is fetched
    });
  }

// Function to get location on the web using Geolocation API
  Future<void> _getWebLocation() async {
    try {
      html.window.navigator.geolocation.getCurrentPosition().then((position) {
        // Safely check for the latitude and longitude values
        num? lat = position.coords!.latitude;
        num? lon = position.coords!.longitude;

        if (lat != null && lon != null) {
          // Create a LocationData object
          setState(() {
            _currentLocation = LocationData.fromMap({
              'latitude': lat,
              'longitude': lon,
            });
            _loading = false; // Hide loading after location is fetched
          });
        } else {
          // Handle case where latitude or longitude is null
          print("Error: Unable to fetch latitude and longitude");
        }
      });
    } catch (e) {
      // Handle error (e.g., location access denied or unavailable)
      print("Error fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Tracking'),
      ),
      body: _loading
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loading until location is fetched
          : FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                    _currentLocation!.latitude!, _currentLocation!.longitude!),
                minZoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(_currentLocation!.latitude!,
                          _currentLocation!.longitude!),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 50,
                      ),
                    )
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kIsWeb) {
            _getWebLocation(); // Refresh location for web
          } else {
            _getMobileLocation(); // Refresh location for mobile
          }
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
    );
  }
}


//This is verum for mobile, works perfectly


// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';

// class GPSTrackingScreen extends StatefulWidget {
//   @override
//   _GPSTrackingScreenState createState() => _GPSTrackingScreenState();
// }

// class _GPSTrackingScreenState extends State<GPSTrackingScreen> {
//   late Location location;
//   LocationData? _currentLocation;
//   bool _loading = true;

//   @override
//   void initState() {
//     super.initState();
//     location = Location();
//     _getLocation();
//   }

//   // Function to request permission and get the current location
//   Future<void> _getLocation() async {
//     // Request permission if not granted
//     bool _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     PermissionStatus _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     // Get the current location
//     LocationData _locationData = await location.getLocation();
//     setState(() {
//       _currentLocation = _locationData;
//       _loading = false; // Hide loading after location is fetched
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GPS Tracking'),
//       ),
//       body: _loading
//           ? Center(
//               child:
//                   CircularProgressIndicator()) // Show loading until location is fetched
//           : FlutterMap(
//               options: MapOptions(
//                 initialCenter: LatLng(
//                     _currentLocation!.latitude!, _currentLocation!.longitude!),
//                 minZoom: 15.0,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   userAgentPackageName: 'dev.fleaflet.flutter_map.example',
//                 ),
//                 MarkerLayer(
//                   markers: [
//                     Marker(
//                       point: LatLng(_currentLocation!.latitude!,
//                           _currentLocation!.longitude!),
//                       // builder: (ctx) => Icon(
//                       //   Icons.location_on,
//                       //   color: Colors.blue,
//                       //   size: 50,
//                       child: Icon(
//                         Icons.location_on,
//                         color: Colors.blue,
//                         size: 50,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _getLocation, // Refresh location on button press
//         child: Icon(Icons.refresh),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }
