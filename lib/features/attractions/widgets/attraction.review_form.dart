import 'package:flutter/material.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/features/attractions/widgets/attractions.ratings_add.dart';


class ReviewForm extends StatelessWidget {
  final String comment;
  final bool loading;
  final Function(String) setComment;
  final num rating;
  final Function(num) setRating;
  final VoidCallback onSubmit;

  const ReviewForm({
    super.key,
    required this.comment,
    required this.rating,
    required this.setComment,
    required this.setRating,
    required this.onSubmit,
    this.loading = false
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Paragraph(
                "Your Rating",
                centered: false,
                color: AppColor.dark,
                size: ParagraphSizes.lg,
                weight: ParagraphWeight.semiBold,
              ),
              const SizedBox(height: 8),
              AddRatings(rating: rating,setRating: setRating),
              const SizedBox(height: 24),
              Paragraph(
                "Message",
                centered: false,
                color: AppColor.dark,
                size: ParagraphSizes.lg,
                weight: ParagraphWeight.semiBold,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.darkShade[50]
                ),
                child: TextField(
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  onChanged: setComment,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your comment here",
                      hintStyle: TextStyle(
                          color: AppColor.darkShade[500]
                      )
                  ),
                ),
              ),
              const SizedBox(height: 16),
              loading
                  ?AppButton(
                    action:(){},
                    color: AppColor.inactive,
                    child: Paragraph(
                      "Loading ....",
                      color: AppColor.darkShade[400],
                      size: ParagraphSizes.lg,
                      weight: ParagraphWeight.semiBold,
                    ),
                  )
                  :(AppButton(
                    action:onSubmit,
                    color: AppColor.primary,
                    child: Paragraph(
                      "Submit",
                      color: AppColor.white,
                      size: ParagraphSizes.lg,
                      weight: ParagraphWeight.semiBold,
                    ),
                  ))
            ],
          ),
        )
    );
  }
}
