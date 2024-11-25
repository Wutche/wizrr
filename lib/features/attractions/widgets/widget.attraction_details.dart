import 'package:app/common/widgets/widget.back_header.dart';
import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.ratings.dart';
import 'package:app/features/attractions/attractions.service.dart';
import 'package:app/features/attractions/widgets/attractions.reviews.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';


class AttractionDetails extends StatelessWidget {
  final Map<String,dynamic> attraction;
  const AttractionDetails({
    super.key,
    required this.attraction,
  });

  @override
  Widget build(BuildContext context) {
    final attractionData = AttractionService.getAttractionModelFromMappedData(attraction);
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(child:  Column(
        children: [
          const BackHeader("Attractions"),
          Expanded(child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 240,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(attractionData.image),
                          )
                      ),
                      // child:Stack(
                      //   children: [
                      //     Positioned(
                      //         right: 10,
                      //         top: 10,
                      //         child:CircleAvatar(
                      //           backgroundColor: Colors.white,
                      //           child:AppIconButton(
                      //               tapHandler: (){},
                      //               child:Icon(Icons.favorite,color: AppColor.primary,)
                      //           ),
                      //         )
                      //     )
                      //   ],
                      // ),
                    ),
                    const SizedBox(height: 8),
                    Paragraph(
                      attractionData.name,
                      color: AppColor.dark,
                      size: ParagraphSizes.x4l,
                      weight: ParagraphWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    Paragraph(attractionData.address!,
                      color: AppColor.primary,
                      weight: ParagraphWeight.light,
                    ),
                    const SizedBox(height: 8),
                    Ratings(
                      starSize: StarSize.lg,
                      rating: AttractionService.getOverallRating(attraction["reviews"]),
                      totalReviews: '(${attractionData.reviews.length})',
                    ),
                    const SizedBox(height: 24),
                    Paragraph(
                      "Description",
                      color: AppColor.dark,
                      size: ParagraphSizes.xl,
                      weight: ParagraphWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        border: Border(top:BorderSide(color: AppColor.darkShade[200] as Color))
                      ),
                      child: Paragraph(attractionData.description,
                        color: AppColor.dark,
                        centered: false,
                      ),
                    ),
                    ReviewSection(reviews: attractionData.reviews,attraction: attraction)
                  ],
                ),
            ),
          ))
        ],
      ))
    );
  }
}
