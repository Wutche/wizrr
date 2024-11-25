import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';

enum _StarType {
  filled,
  half,
  outlined
}
class _Star extends StatelessWidget {
  final _StarType type;
  final Function setRating;

  const _Star({
    super.key,
    this.type = _StarType.outlined,
    required this.setRating,
  });

  @override
  Widget build(BuildContext context) {
    if(type == _StarType.outlined){
      return  GestureDetector(
        onTap: ()=> {setRating()},
        child: Container(
          margin: const EdgeInsets.only(right: 4),
          child: Icon(Icons.star_border_outlined,color: AppColor.orange,),
        )
      );
    }
    if(type == _StarType.half){
      return  GestureDetector(
        onTap: ()=>setRating(),
        child: Container(
          margin: const EdgeInsets.only(right: 4),
          child: Icon(Icons.star_half,color: AppColor.orange,),
        ),
      );
    }
    return  GestureDetector(
      onTap: ()=>setRating(),
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: Icon(Icons.star,color: AppColor.orange,),
      )
    );
  }
}

class AddRatings extends StatelessWidget {
  final num rating;
  final Function(num) setRating;
  const AddRatings({
    super.key,
    required this.setRating,
    this.rating = 1,
  });

  getStarType(num rating ,{ required num currentStar, num prevStar = 0}){
    if(rating == currentStar  || rating > currentStar) return _StarType.filled;
    if(rating > prevStar && rating < currentStar) return _StarType.half;
    return _StarType.outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (index) {
        return _Star(
          setRating:()=>setRating(index + 1),
          type: getStarType(
              rating,
              currentStar: index + 1,
              prevStar: index
          ),
        );
      })
    );
  }
}