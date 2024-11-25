import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.ratings.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/features/attractions/attraction.model.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  const ReviewCard( this.review,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              review.photoURL.isNotEmpty
              ?CircleAvatar(
                  radius: 24,
                  foregroundImage: NetworkImage(review.photoURL),
                )
              :CircleAvatar(
                radius: 24,
                backgroundColor: AppColor.darkShade[100],
                child: Icon(Icons.person,color: AppColor.inactive,size: 20),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Paragraph(
                    review.author,
                    color: AppColor.primary,
                    size: ParagraphSizes.lg,
                    weight: ParagraphWeight.bold,
                  ),
                  Paragraph(
                    review.date != null
                        ?review.date?.toDate().toIso8601String() as String
                        :DateTime.now().toIso8601String(),
                    color: AppColor.dark,
                    size: ParagraphSizes.sm,
                    weight: ParagraphWeight.light,
                  ),
                  Ratings(rating:review.rating,textSize: ParagraphSizes.md)
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 8),
          Paragraph(
            review.comment.substring(0,review.comment.length > 100?100:review.comment.length),
            color: AppColor.dark,
            centered: false,
          ),
        ],
      )
    );
  }
}
