import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';


enum _StarType {
  filled,
  half,
  outlined
}

enum StarSize {
  lg,
  md,
  sm
}
class _Star extends StatelessWidget {
  final StarSize starSize;
  final _StarType type;

  const _Star({
    super.key,
    this.type = _StarType.outlined,
    this.starSize = StarSize.md,
  });

  double transformStarSize(){
    if(starSize == StarSize.lg) return 24;
    if(starSize == StarSize.sm) return 14;
    return 18;
  }


  @override
  Widget build(BuildContext context) {
    if(type == _StarType.outlined){
      return  Container(
        margin: const EdgeInsets.only(right: 4),
        child: Icon(Icons.star_border_outlined,color: AppColor.orange,size: transformStarSize(),),
      );
    }
    if(type == _StarType.half){
      return  Container(
        margin: const EdgeInsets.only(right: 4),
        child: Icon(Icons.star_half,color: AppColor.orange,size: transformStarSize()),
      );
    }
    return  Container(
      margin: const EdgeInsets.only(right: 4),
      child: Icon(Icons.star,color: AppColor.orange,size: transformStarSize()),
    );
  }
}

class Ratings extends StatelessWidget {
  final num rating;
  final String? totalReviews;
  final StarSize starSize;
  final ParagraphSizes textSize;

  const Ratings({
    super.key,
    this.rating = 0.0,
    this.totalReviews,
    this.starSize = StarSize.md,
    this.textSize = ParagraphSizes.xl
  });

  getStarType(num rating ,{ required num currentStar, num prevStar = 0}){
    if(rating == currentStar  || rating > currentStar) return _StarType.filled;
    if(rating > prevStar && rating < currentStar) return _StarType.half;
    return _StarType.outlined;
  }

  List<_Star> _getStars(){
    return List.generate(5, (index) =>  _Star(
      starSize: starSize,
      type: getStarType(
          rating,
          currentStar: index + 1,
          prevStar: index
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ..._getStars(),
        Paragraph(
          rating.toStringAsFixed(1),
          color: AppColor.dark,
          size: textSize,
          weight: ParagraphWeight.bold,
        ),
        const SizedBox(width:2),
        Paragraph(
          totalReviews??"",
          color: AppColor.dark,
          size: textSize,
          weight: ParagraphWeight.bold,
        ),
      ],
    );
  }
}