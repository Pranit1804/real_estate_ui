import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/modules/home/home_constants.dart';
import 'package:real_estate_ui/modules/home/presentation/widgets/single_estate_tile.dart';

class EstateListing extends StatefulWidget {
  const EstateListing({
    super.key,
  });

  @override
  State<EstateListing> createState() => _EstateListingState();
}

class _EstateListingState extends State<EstateListing> {
  bool _animateListings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 2500));
      if (mounted) {
        setState(() {
          _animateListings = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
        offset: _animateListings ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(LayoutConstants.dimen_30)),
            color: AppColor.white,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: HomeConstants.estateList
                        .map(
                          (listing) => StaggeredGridTile.count(
                            crossAxisCellCount:
                                listing.widgetInfo.crossAxisAligment,
                            mainAxisCellCount:
                                listing.widgetInfo.mainAxisAlignment,
                            child: SingleEstateTile(
                                image: listing.image,
                                address: listing.address,
                                alignment: Alignment.center),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
