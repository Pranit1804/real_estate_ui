import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/extensions/screen_utils_extensions.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/modules/search/presentation/widgets/search_appbar.dart';
import 'package:real_estate_ui/modules/search/presentation/widgets/single_menu_item.dart';
import 'package:real_estate_ui/modules/search/presentation/widgets/single_option_tile.dart';
import 'package:real_estate_ui/modules/search/search_constants.dart';
import 'package:real_estate_ui/modules/search/services/google_map_service.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _mapController = Completer<GoogleMapController>();
  String _mapStyle = '';
  bool _animateItems = false;
  bool _animateOptions = false;

  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(6.6025926099405226, 3.2849539756822987),
    zoom: 16,
  );

  Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    final String style =
        await rootBundle.loadString('assets/files/map_style.json');
    setState(() {
      _mapStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundMap(),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LayoutConstants.dimen_22.w,
              vertical: LayoutConstants.dimen_12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchAppbar(
                  animateItems: _animateItems,
                ),
                const Spacer(),
                _buildMenuTileWithOption(),
                _buildLongMenuTile(),
                const SizedBox(height: kBottomNavigationBarHeight * 1.4),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildBackgroundMap() {
    return GoogleMap(
      style: _mapStyle,
      initialCameraPosition: _initialCameraPosition,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) async {
        _mapController.complete(controller);
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(milliseconds: 1000));
          if (mounted) {
            setState(() {
              _animateItems = true;
            });
          }
        });
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(milliseconds: 600));
          _markers = await GoogleMapService.addMarkers();
          if (mounted) {
            setState(() {});
          }
        });
      },
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
    );
  }

  Widget _buildMenuTileWithOption() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: SingleOptionTile(
            icon: Icons.layers,
            animateItem: _animateItems,
            onTap: () {
              setState(() {
                _animateOptions = true;
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _animateOptions = false;
            });
          },
          child: AnimatedScale(
            alignment: Alignment.bottomLeft,
            scale: _animateOptions ? 1 : 0,
            duration: const Duration(milliseconds: 700),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: SearchConstants.menuItems.map((item) {
                    return SingleMenuItem(
                      item: item,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLongMenuTile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const SizedBox(height: 4),
            SingleOptionTile(
              icon: Icons.arrow_outward,
              animateItem: _animateItems,
              onTap: () {
                setState(() {
                  _animateOptions = true;
                });
              },
            ),
          ],
        ),
        AnimatedScale(
          scale: _animateItems ? 1 : 0,
          duration: const Duration(milliseconds: 700),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.lightWhite.withOpacity(0.9),
                borderRadius: BorderRadius.circular(28)),
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
              child: Row(
                children: [
                  Icon(Icons.menu, color: AppColor.white),
                  SizedBox(width: 10),
                  Text(
                    'List of variants',
                    style: TextStyle(color: AppColor.white),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
