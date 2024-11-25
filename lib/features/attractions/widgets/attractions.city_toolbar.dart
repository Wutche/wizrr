import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';

class City extends StatelessWidget{
  final String name;
  final Image image;
  final bool isActive;
  const City(this.name,{
    super.key,
    required this.image,
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
          Container(
           height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: image.image
              )
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


class CityToolBar extends StatelessWidget {
  final List<City> attractions = [
    City("Tokyo", image: Image.asset("assets/images/product-banner.jpg",fit: BoxFit.cover,)),
    City("Japan", image: Image.asset("assets/images/product-banner.jpg",fit: BoxFit.cover,)),
    City("Enugu", image: Image.asset("assets/images/product-banner.jpg",fit: BoxFit.cover,)),
    City("Bayelsa", image: Image.asset("assets/images/product-banner.jpg",fit: BoxFit.cover,)),
    City("Lagos",image: Image.asset("assets/images/product-banner.jpg",fit: BoxFit.cover,)),
    City("Port Harcourt", image: Image.asset("assets/images/product-banner.jpg",fit: BoxFit.cover,)),
  ];
  CityToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: attractions.length,
      itemBuilder: (context,index){
        return attractions[index];
      });
  }
}
