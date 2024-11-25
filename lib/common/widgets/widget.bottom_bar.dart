import 'package:app/common/data/data.links.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/types/type.link.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _BottomBarItem extends StatelessWidget {
  final LinkDataObject linkData;
  final VoidCallback action;
  final bool isActive;
  const _BottomBarItem({
    super.key,
    required this.linkData,
    required this.isActive,
    required this.action
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: action,
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  constraints: const BoxConstraints(
                      minWidth: 64,
                      maxWidth: 64
                  ),
                  decoration: BoxDecoration(
                      color: isActive?AppColor.primary:AppColor.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: isActive
                      ?Image.asset(linkData.activeIcon)
                      :Image.asset(linkData.icon)
                  ,
                ),
                const SizedBox(height: 4,),
                Paragraph(linkData.text,
                  color: isActive?AppColor.primary:AppColor.inactive,
                  size: ParagraphSizes.sm,
                  weight: ParagraphWeight.semiBold,
                )
              ],
            ),
          ),
        )
    );
  }
}


class BottomBar extends StatelessWidget {
  final String activeTab;
  const BottomBar({super.key,this.activeTab = "home"});

  Widget getBottomLinks(Map<String,dynamic> data,BuildContext context,{String activeTab = "home"}){
    LinkDataObject linkData = LinkDataObject(
        data["title"],
        activeIcon: data["activeIconUrl"],
        key: data["key"],
        icon: data["iconUrl"]
    );
    return _BottomBarItem(
        linkData: linkData,
        action: ()=>context.go(data["url"]),
        isActive:linkData.key == activeTab
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      color: AppColor.white,
      child: Row(
        children: bottomLinks
            .map((e) => getBottomLinks(e, context,activeTab:activeTab))
            .toList(),
      ),
    );
  }
}
