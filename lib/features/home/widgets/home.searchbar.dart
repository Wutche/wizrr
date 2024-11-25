import 'package:app/core/core.colors.dart';
import 'package:flutter/material.dart';

class SearchBarContainer extends StatelessWidget {
  final Function(String) setSearchQuery;
  const SearchBarContainer({super.key,required this.setSearchQuery});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColor.gray_2,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 36,
            width: 36,
            child: Icon(Icons.search)
          ),
          Expanded(
              child:TextField(
                onChanged: setSearchQuery,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText: "Search Attraction",
                    hintStyle: TextStyle(
                        color: AppColor.darkShade[300]
                    )
                ),
              )
          )
        ],
      ),
    );
  }
}


class HomeSearchBar extends StatelessWidget {
  final Function(String) setSearchQuery;
  const HomeSearchBar({super.key, required this.setSearchQuery});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: SearchBarContainer(setSearchQuery: setSearchQuery),
          ),
          const SizedBox(width: 8,),
        ],
      ),
    );
  }
}
