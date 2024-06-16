import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_ui/modules/search/presentation/widgets/map_marker.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class GoogleMapService {
  static Future<Set<Marker>> addMarkers() async {
    return {
      Marker(
        markerId: const MarkerId('marker1'),
        position: const LatLng(6.607354, 3.287309),
        icon: await const MapMarker(title: '10,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker2'),
        position: const LatLng(6.608401, 3.283308),
        icon: await const MapMarker(title: '11 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker3'),
        position: const LatLng(6.604992, 3.287754),
        icon: await const MapMarker(title: '7,8 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker4'),
        position: const LatLng(6.604992, 3.291548),
        icon: await const MapMarker(title: '8,5 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker5'),
        position: const LatLng(6.600324, 3.283097),
        icon: await const MapMarker(title: '13,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker6'),
        position: const LatLng(6.597686, 3.286839),
        icon: await const MapMarker(title: '6,95 mn P').toBitmapDescriptor(),
      )
    };
  }
}
