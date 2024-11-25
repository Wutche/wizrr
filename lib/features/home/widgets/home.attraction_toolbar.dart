import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';

class AttractionCategoryData {
  final String name;
  final Widget icon;
  final Widget activeIcon;

  const AttractionCategoryData(this.name, {
    required this.icon,
    required this.activeIcon,
  });
}

class AttractionCategory extends StatelessWidget{
  final String name;
  final Widget icon;
  final Widget activeIcon;
  final VoidCallback selectCategory;

  final bool isActive;
  const AttractionCategory(this.name,{
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.selectCategory,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: selectCategory,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: isActive?AppColor.primary:AppColor.darkShade[50],
              child: isActive?activeIcon:icon,
            ),
          ),
          const SizedBox(height: 8),
          Paragraph(
              name,
              color: AppColor.dark,
              size: ParagraphSizes.lg,
              weight: isActive?ParagraphWeight.medium:ParagraphWeight.regular,
          )
        ],
      ),
    );
  }
}


class AttractionToolBar extends StatelessWidget {
  final Function(String) selectCategory;
  final String selectedCategory;

  final List<AttractionCategoryData> attractions = [
    AttractionCategoryData(
        "All",
        icon: Icon(Icons.all_inclusive,color: AppColor.inactive),
      activeIcon: Icon(Icons.all_inclusive,color: AppColor.white),
    ),
    AttractionCategoryData(
        "Hotels",
        icon: Icon(Icons.hotel,color: AppColor.inactive),
      activeIcon: Icon(Icons.hotel,color: AppColor.white),
    ),
    AttractionCategoryData(
        "Restaurant",
        icon: Icon(Icons.local_dining_sharp,color: AppColor.inactive),
      activeIcon: Icon(Icons.local_dining_sharp,color: AppColor.white),
    ),
    AttractionCategoryData(
        "Events",
        icon: Icon(Icons.place,color: AppColor.inactive),
      activeIcon: Icon(Icons.place,color: AppColor.white),
    ),
    AttractionCategoryData(
        "Parks",
        icon: Icon(Icons.park,color: AppColor.inactive),
      activeIcon: Icon(Icons.park,color: AppColor.white),
    ),
    AttractionCategoryData(
        "Golfing",
        icon: Icon(Icons.golf_course,color: AppColor.inactive),
      activeIcon: Icon(Icons.golf_course,color: AppColor.white),
    ),
    AttractionCategoryData(
        "Shopping",
        icon: Icon(Icons.add_shopping_cart,color: AppColor.inactive),
        activeIcon: Icon(Icons.add_shopping_cart,color: AppColor.white)
    ),
    AttractionCategoryData(
        "Mountains",
        icon: Icon(Icons.map,color: AppColor.inactive),
      activeIcon: Icon(Icons.map,color: AppColor.white),
    ),
  ];
  AttractionToolBar({
    super.key,
    this.selectedCategory = "all",
    required this.selectCategory
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: attractions.length,
      itemBuilder: (context,index){
        var attraction = attractions[index];
        return AttractionCategory(
            attraction.name,
            selectCategory: ()=>selectCategory(attraction.name.toLowerCase()),
            icon: attraction.icon,
            activeIcon: attraction.activeIcon,
            isActive: selectedCategory == attraction.name.toLowerCase()
        );
      });
  }
}
