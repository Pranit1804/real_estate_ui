import 'package:flutter/material.dart';
import 'package:real_estate_ui/common/constants/layout_constants.dart';
import 'package:real_estate_ui/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:real_estate_ui/modules/search/data/model/menu_item_model.dart';

class SingleMenuItem extends StatelessWidget {
  final MenuItemModel item;
  const SingleMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(LayoutConstants.dimen_10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon,
            color: item.id == 1 ? AppColor.primaryColor : AppColor.lightWhite,
          ),
          const SizedBox(width: 12),
          Text(
            item.name,
            style: TextStyle(
              color: item.id == 1 ? AppColor.primaryColor : AppColor.lightWhite,
            ),
          ),
        ],
      ),
    );
  }
}
