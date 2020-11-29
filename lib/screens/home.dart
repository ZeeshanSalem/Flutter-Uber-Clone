import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/utils/core.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Map()
    );

  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  GoogleMapController mapController;
  static const _initialPostion = LatLng(12.92, 77.02);
  LatLng _lastPosition = _initialPostion;

  final Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPostion,
              zoom: 10,
            ),
          onMapCreated: onCreated,
          myLocationEnabled: true,
          mapType: MapType.normal,
          compassEnabled: true,
          markers: _markers,
          onCameraMove: _onCameraMove,
        ),

//        Positioned(
//            top: 40,
//            right: 40,
//            child: FloatingActionButton(
//              onPressed: _onAddMarkerPress,
//              tooltip: "add marker",
//              backgroundColor: black,
//              child: Icon(Icons.add_location, color: white,),
//            ),
//        )
      Positioned(
          top: 50.0,
          right: 15,
          left: 15,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 5.0),
                  spreadRadius: 3,
                  blurRadius: 10,
                )
              ]
            ),
            child: TextField(
              cursorColor: Colors.black,
//              controller: locationController,
            decoration: InputDecoration(
              icon: Container(
                margin: EdgeInsets.only(left: 20, top: 5),
                height: 10,
                width: 10,
                child: Icon(Icons.location_on,color: Colors.black,),
              ),
              hintText: "PickUp",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
            ),
            ),
          ),),

        Positioned(
          top: 105.0,
          right: 15,
          left: 15,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 5.0),
                    spreadRadius: 3,
                    blurRadius: 10,
                  )
                ]
            ),
            child: TextField(
              cursorColor: Colors.black,
//              controller: locationController,
              decoration: InputDecoration(
                icon: Container(
                  margin: EdgeInsets.only(left: 20, top: 5),
                  height: 10,
                  width: 10,
                  child: Icon(Icons.local_taxi,color: Colors.black,),
                ),
                hintText: "Destination",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
              ),
            ),
          ),),
      ],
    );
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition = position.target;
    });
  }

  void _onAddMarkerPress() {
    setState(() {
      _markers.add(Marker(markerId: MarkerId(_lastPosition.toString()),
          position: _lastPosition,
        infoWindow: InfoWindow(
          title: "remember here",
          snippet: "good place"
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
