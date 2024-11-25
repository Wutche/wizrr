import 'package:app/common/widgets/widget.wishlist.dart';
import 'package:app/features/attractions/widgets/widget.attraction_details.dart';
import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.modal.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';


enum _StarType {
  filled,
  half,
  outlined
}
class _Star extends StatelessWidget {
  final _StarType type;
  const _Star({
    super.key,
    this.type = _StarType.outlined
  });

  @override
  Widget build(BuildContext context) {
    if(type == _StarType.outlined){
      return  Container(
        margin: const EdgeInsets.only(right: 4),
        child: Icon(Icons.star_border_outlined,color: AppColor.orange,),
      );
    }
    if(type == _StarType.half){
      return  Container(
        margin: const EdgeInsets.only(right: 4),
        child: Icon(Icons.star_half,color: AppColor.orange,),
      );
    }
    return  Container(
      margin: const EdgeInsets.only(right: 4),
      child: Icon(Icons.star,color: AppColor.orange,),
    );
  }
}

class _Ratings extends StatelessWidget {
  final num rating;
  final String? totalReviews;

  const _Ratings({super.key,this.rating = 0.0,this.totalReviews});

  getStarType(num rating ,{ required num currentStar, num prevStar = 0}){
    if(rating == currentStar  || rating > currentStar) return _StarType.filled;
    if(rating > prevStar && rating < currentStar) return _StarType.half;
    return _StarType.outlined;
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Star(
          type: getStarType(
              rating,
              currentStar: 1,
              prevStar: 0
          ),
        ),
        _Star(
          type: getStarType(
              rating,
              currentStar: 2,
              prevStar: 1
          ),
        ),
        _Star(
          type: getStarType(
              rating,
              currentStar: 3,
              prevStar: 2
          ),
        ),
        _Star(
          type: getStarType(
              rating,
              currentStar: 4,
              prevStar: 3
          ),
        ),
        _Star(
          type: getStarType(
              rating,
              prevStar: 4,
              currentStar: 5,
          ),
        ),

        Paragraph(rating.toStringAsFixed(1),
          color: AppColor.dark,
          size: ParagraphSizes.xl,
          weight: ParagraphWeight.bold,
        ),
        Paragraph(totalReviews??"",
          color: AppColor.dark,
          size: ParagraphSizes.xl,
          weight: ParagraphWeight.bold,
        ),
      ],
    );
  }
}

final LocalStorage storage = LocalStorage('explorer');

class AttractionCard extends StatelessWidget {
  final String name;
  final String image;
  final String address;
  final bool inWishlist;
  final num ratings;
  final Map<String,dynamic> attractionData;
  const AttractionCard({
    super.key,this.inWishlist = false,
    required this.name,
    required this.image,
    required this.address,
    required this.ratings,
    required this.attractionData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
              AppModal.showCustomModal(context, AttractionDetails(attraction: attractionData,));
          },
          child:Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image),
                )
            ),
            child:Stack(
              children: [
                Positioned(
                    right: 10,
                    top: 10,
                    child:CircleAvatar(
                      backgroundColor: Colors.white,
                      child:AppIconButton(
                          tapHandler: (){},
                          child:WishlistButton(id: attractionData["id"])
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Paragraph(
            name,
            color: AppColor.primary,
            size: ParagraphSizes.xl,
            weight: ParagraphWeight.bold,
        ),
        const SizedBox(height: 8),
        Paragraph(
           address,
            color: AppColor.dark,
            weight: ParagraphWeight.light,
        ),
        const SizedBox(height: 8),
        _Ratings(rating: ratings,),
        const SizedBox(height: 32,)
      ],
    );
  }
}
