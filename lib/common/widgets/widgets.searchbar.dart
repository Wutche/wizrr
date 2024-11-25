import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/core/core.colors.dart';
import 'package:flutter/material.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({super.key});

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
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Row(
        children: [
          const Expanded(
              child: SearchBarContainer(),
          ),
          const SizedBox(width: 8,),
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.darkShade[50],
            child: AppIconButton(
              tapHandler: (){},
              child: Image.asset("assets/icons/tune.png"),
            ),
          )

        ],
      ),
    );
  }
}
