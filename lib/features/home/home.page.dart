import 'package:app/common/layouts/layout.home.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/services/service.firestore.dart';
import 'package:app/features/attractions/widgets/attractions.list.dart';
import 'package:app/features/home/widgets/home.attraction_toolbar.dart';
import 'package:app/features/home/widgets/home.attractions_header.dart';
import 'package:app/features/home/widgets/home.searchbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String searchQuery = "";
  setSearch(String value){
    setState(() {
      searchQuery = value;
    });
  }

  String category = "all";
  setCategory(String value){
    setState(() {
      category = value;
    });
  }


  final _usersStream = FireStoreService.getCollectionStream("attractions");

  final List<Map<String,dynamic>> defaultAttractions = [];
  Map<String,dynamic> transformAttractionData(Map<String,dynamic> data,String id){
    var newData = {
      ...data,
      "id":id
    };
    return newData;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _usersStream, builder: (context,snapShot){
      return HomeLayout(
          backgroundColor: AppColor.light,
          child: Column(
            children: [
              HomeSearchBar(setSearchQuery: setSearch),
              SizedBox(
                height:92 ,
                // constraints: const BoxConstraints(
                //   minHeight: 92
                // ),
                child: AttractionToolBar(
                    selectedCategory: category,
                    selectCategory: setCategory,
                ),
              ),
              const AttractionsHeader(),
              Expanded(
                  child: SingleChildScrollView(
                      child:AttractionList(
                        category: category,
                        searchQuery: searchQuery,
                        loading: snapShot.connectionState == ConnectionState.waiting,
                        attractions:snapShot.data != null
                          ?snapShot.data!.docs
                          .map((doc) => transformAttractionData(doc.data(), doc.id))
                          .toList()
                          :defaultAttractions,
                      )
                  )),
            ],
          )
      );
    });
  }
}
