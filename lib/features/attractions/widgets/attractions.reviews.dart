import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/common/widgets/widget.title_header.dart';
import 'package:app/core/services/service.modal.dart';
import 'package:app/features/attractions/attraction.model.dart';
import 'package:app/features/attractions/widgets/attractions.add_review.dart';
import 'package:app/features/attractions/widgets/attractions.review.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/features/attractions/widgets/widgets.reviews_page.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget{
  final Map<String,dynamic> attraction;
  final List<ReviewModel> reviews;
  const ReviewSection({
    super.key,required this.reviews,
    required this.attraction
  });

  List<ReviewCard> getReviewCardFromData(){
    if(reviews.length >= 3) return reviews.sublist(0,3).map((review) => ReviewCard(review)).toList();
    return reviews.sublist(0,reviews.length).map((review) => ReviewCard(review)).toList();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            TitleHeader(
              "Ratings and Reviews",
              action: (){
                AppModal.showCustomModal(context, ReviewsPage(reviews: reviews,attraction: attraction,));
              },
              buttonText: "See All Reviews",),
            ...getReviewCardFromData(),
            const SizedBox(height: 16),
            AppButton(
                action: (){
                  AppModal.showCustomModal(context,
                      AddReview(
                        attraction: attraction,
                        attractionId: attraction["id"],
                      ));
                },
                color: AppColor.primary,
                child:Paragraph(
                  "Add Review",
                  color: AppColor.white,
                  size: ParagraphSizes.lg,
                  weight: ParagraphWeight.bold,
                ),
            )
          ],
        )
    );
  }
}