import 'package:app/common/layouts/layout.home.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.firestore.dart';
import 'package:app/features/attractions/widgets/attractions.city_toolbar.dart';
import 'package:app/features/attractions/widgets/attractions.list.dart';
import 'package:app/features/home/widgets/home.searchbar.dart';
import 'package:flutter/material.dart';

import '../../core/services/service.snackbar.dart';
import 'attractions.service.dart';

class AttractionPage extends StatefulWidget {
  const AttractionPage({super.key});

  @override
  State<AttractionPage> createState() => _AttractionPageState();
}

class _AttractionPageState extends State<AttractionPage> {
  String searchQuery = "";
  setSearch(String value){
    setState(() {
      searchQuery = value;
    });
  }

  final List<Map<String,dynamic>> defaultAttractions = [];
  final _usersStream = FireStoreService.getCollectionStream("attractions");

  Map<String,dynamic> transformAttractionData(Map<String,dynamic> data,String id){
    var newData = {
      ...data,
      "id":id
    };
    return newData;
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _usersStream, builder: (context,snapShot){
          return HomeLayout(
              activePage: "attractions",
              backgroundColor: AppColor.light,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeSearchBar(setSearchQuery: setSearch,),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  //   child: Paragraph(
                  //     "Filter By City",
                  //     color: AppColor.black,
                  //     size: ParagraphSizes.xl,
                  //     weight: ParagraphWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height:92 ,
                  //   // constraints: const BoxConstraints(
                  //   //   minHeight: 92
                  //   // ),
                  //   child: CityToolBar(),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Paragraph(
                      "Popular Attractions",
                      color: AppColor.black,
                      size: ParagraphSizes.x5l,
                      weight: ParagraphWeight.bold,
                      centered: true,
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child:AttractionList(
                              searchQuery: searchQuery,
                              loading: snapShot.connectionState == ConnectionState.waiting,
                              attractions:snapShot.data !=null
                                  ?snapShot.data!.docs
                                  .map((doc) => transformAttractionData(doc.data(), doc.id)).toList()
                                  :defaultAttractions,
                          )
                      ))
                ],
              )
          );
      }
    );
  }
}
