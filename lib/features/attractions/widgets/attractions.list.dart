import 'package:flutter/material.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/features/attractions/attractions.service.dart';



class AttractionList extends StatelessWidget {
  final bool loading;
  final String searchQuery;
  final String category;
  final List<Map<String,dynamic>> attractions;
  const AttractionList({
    super.key,
    this.loading = true,
    required this.attractions,
    this.searchQuery = "",
    this.category = "all"
  });

  List<Map<String,dynamic>> getFilters(){
    var firstFilter = attractions.where((attraction){
      String name = attraction["name"].toString().toLowerCase();
      String transformedString = searchQuery.toLowerCase();
      return name.contains(transformedString);
    }).toList();

    if(category =="all") return firstFilter;
    return attractions.where((attraction){
      String attractionType = attraction["attraction_type"].toString().toLowerCase();
      return attractionType == category.toLowerCase();
    }).toList();

  }


  @override
  Widget build(BuildContext context) {
    var result = getFilters();
    if(loading){
      return Center(
          child: Paragraph("Loading Attractions.....", color: AppColor.primary)
      );
    }
    return Padding(
      padding:  const EdgeInsets.all(16),
      child: Column(
        children: AttractionService.getAttractionCardFromData(result),
      ),
    );
  }
}
