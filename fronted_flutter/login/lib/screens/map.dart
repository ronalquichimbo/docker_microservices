import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class Mapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: _Mapbox(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_before),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }
}

class _Mapbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(-4.004434400796892, -79.21003768869868),
          zoom: 15.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/rvquichimbo/ckx6ny1fi120114s68qyk76bw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnZxdWljaGltYm8iLCJhIjoiY2t4Nm1idGpwMm5vNzJ2cGg2Y3FudXp0NSJ9.iT2r2ItnFW5dyZ3Gc-2yFQ",
            additionalOptions: {
              'accessToke:':
                  'pk.eyJ1IjoicnZxdWljaGltYm8iLCJhIjoiY2t4Nm1idGpwMm5vNzJ2cGg2Y3FudXp0NSJ9.iT2r2ItnFW5dyZ3Gc-2yFQ',
              'id': 'mapbox://styles/rvquichimbo/ckx6ny1fi120114s68qyk76bw'
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                  width: 50.0,
                  height: 50.0,
                  point: LatLng(-4.0067069298506395, -79.20648066532499),
                  builder: (ctx) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Colors.amber.shade700,
                        size: 60,
                      ),
                    );
                  }),
              Marker(
                width: 50.0,
                height: 50.0,
                point: LatLng(-4.0026613470631, -79.20655090615915),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on_sharp,
                    color: Colors.amber.shade700,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
