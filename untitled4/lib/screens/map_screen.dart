// import 'dart:async';
// import 'dart:typed_data';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class MapScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MapScreenState();
//   }
// }
//
// class MapScreenState extends State<MapScreen> {
//    GoogleMapController? _controller;
//     StreamSubscription? _locationSubscription;
//       Marker marker = Marker(markerId: MarkerId("33"));
//   Circle circle = Circle(circleId: CircleId("33"));
//   Location? _locationTracker ;
//   List<Marker> markers = [];
//   TextEditingController noteTextEditingController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _determinePosition();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .50,
//               width: MediaQuery.of(context).size.width,
//               child: GoogleMap(
//                   onMapCreated: (GoogleMapController controller) {
//           _controller = controller;
//         },
//                      markers: Set.of((marker != null) ? [marker] : []),
//         circles: Set.of((circle != null) ? [circle] : []),
//                   onTap: onMapTap,
//                   mapType: MapType.hybrid,
//                   myLocationButtonEnabled: true,
//                   myLocationEnabled: true,
//                   initialCameraPosition: CameraPosition(
//                       target: LatLng(31.9732595, 35.9121911), zoom: 15)),
//             ),
//             SizedBox(
//               height: (MediaQuery.of(context).size.height * .35) - 50,
//               width: MediaQuery.of(context).size.width,
//               child: TextField(
//                 keyboardType: TextInputType.multiline,
//                 controller: noteTextEditingController,
//                 decoration: InputDecoration(
//                     label: Text("Note"), hintText: "Insert Your Note Please"),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: SizedBox(
//         height: (MediaQuery.of(context).size.height * .15) - 50,
//         width: MediaQuery.of(context).size.width,
//         child: TextButton(onPressed: () {}, child: Text("Done")),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//
//
//       },
//       child: Icon(Icons.search),
//       ),
//     );
//   }
//
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     return await Geolocator.getCurrentPosition();
//   }
//
//   onMapTap(LatLng latLng) {
//
//     if (markers.isEmpty) {
//       markers.add(Marker(markerId: MarkerId("1"), position: latLng));
//     } else {
//       markers[0] = Marker(markerId: MarkerId("1"), position: latLng);
//     }
//     setState(() {});
//   }
//
//     void getCurrentLocation() async {
//
//     try {
//
//       Uint8List imageData = await getMarker();
//       var location = await _locationTracker!.getLocation();
//
//       updateMarkerAndCircle(location, imageData);
//
//       if (_locationSubscription != null) {
//         _locationSubscription!.cancel();
//       }
//
//
//       _locationSubscription = _locationTracker!.onLocationChanged().listen((newLocalData) {
//         if (_controller != null) {
//           _controller!.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//               bearing: 192.8334901395799,
//               target: LatLng(newLocalData.latitude, newLocalData.longitude),
//               tilt: 0,
//               zoom: 18.00)));
//           updateMarkerAndCircle(newLocalData, imageData);
//         }
//       });
//
//     } on PlatformException catch (e) {
//       if (e.code == 'PERMISSION_DENIED') {
//         debugPrint("Permission Denied");
//       }
//     }
//   }
//
//     void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
//     LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
//     this.setState(() {
//       marker = Marker(
//           markerId: MarkerId("home"),
//           position: latlng,
//           rotation: newLocalData.heading,
//           draggable: false,
//           zIndex: 2,
//           flat: true,
//           anchor: Offset(0.5, 0.5),
//           icon: BitmapDescriptor.fromBytes(imageData));
//       circle = Circle(
//           circleId: CircleId("car"),
//           radius: newLocalData.accuracy,
//           zIndex: 1,
//           strokeColor: Colors.blue,
//           center: latlng,
//           fillColor: Colors.blue.withAlpha(70));
//     });
//   }
//
//     Future<Uint8List> getMarker() async {
//     ByteData byteData = await DefaultAssetBundle.of(context).load("assets/car_icon.png");
//     return byteData.buffer.asUint8List();
//   }
// }
