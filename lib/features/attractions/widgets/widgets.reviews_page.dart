import 'package:app/common/widgets/widget.back_header.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.modal.dart';
import 'package:app/features/attractions/attraction.model.dart';
import 'package:app/features/attractions/widgets/attractions.add_review.dart';
import 'package:app/features/attractions/widgets/attractions.review.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  final Map<String,dynamic> attraction;
  final List<ReviewModel> reviews;

  List<ReviewCard> getReviewCardFromData(){
    return reviews.sublist(0,reviews.length).map((review) => ReviewCard(review)).toList();
  }
  const ReviewsPage({super.key,required this.reviews,required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackHeader("Reviews and Ratings"),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: getReviewCardFromData(),
                      ),
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                  action: (){
                    AppModal.showCustomModal(context, AddReview(attraction: attraction,attractionId: attraction["id"],));
                  },
                  color: AppColor.primary,
                  child:Paragraph(
                    "Add Review",
                    color: AppColor.white,
                    size: ParagraphSizes.lg,
                    weight: ParagraphWeight.bold,
                  ),
                ),
            )
          ],
        ))
    );
  }
}
