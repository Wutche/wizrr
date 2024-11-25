import 'package:app/common/widgets/widget.attraction_card.dart';
import 'package:app/core/services/service.firestore.dart';

import 'attraction.model.dart';

class AttractionResponse<T>{
  final T? data;
  final Object? e;
  AttractionResponse({
    this.data,
    this.e
  });
}

class AttractionService{
  static List<AttractionCard> getAttractionCardFromData(List<Map<String,dynamic>> attractions){
    if(attractions.isNotEmpty) {
      return attractions.map((attraction) {
        final String name = attraction["name"];
        final String image = attraction["image"];
        final String address = attraction["short_address"];
        final num rating = AttractionService.getOverallRating(attraction["reviews"]);

        return AttractionCard(
          name: name,
          image: image,
          address: address,
          ratings: rating,
          attractionData: attraction,
        );
      }).toList();
    }
    return [];
  }

  static num getOverallRating(List<dynamic> reviews){
    if(reviews.isEmpty) return 0.0;
    num totalRating = 0;

    for(var review in reviews){
      totalRating += review["rating"];
    }

    return totalRating/reviews.length;
 }

  static Future<AttractionResponse<List<Map<String,dynamic>>>> getAttractions(Function onFinish) async{
    try{
      var attractionsCollections = await FireStoreService.getCollections("attractions");
      return AttractionResponse(
        data: attractionsCollections,
      );
    }
    catch(e){
      return AttractionResponse(
        e: e
      );
    }
    finally{
      onFinish();
    }
  }
  static AttractionModel getAttractionModelFromMappedData(Map<String,dynamic> attraction){
    if(attraction["reviews"] == null){
      return AttractionModel(attraction,[]);
    }
    var reviews = (attraction["reviews"] as List<dynamic>)
        .map((item) => ReviewModel(item)).toList();

    return AttractionModel(attraction,reviews);
  }

  static addReview(
      Map<String,dynamic> attraction,
      String attractionId, Map<String,dynamic>newReview,
      {required Function onSuccess,required Function onFinish, required Function(Object e) onError}) async{
      try{
        var reviews = [
          ...attraction["reviews"],
          newReview,
        ];
        attraction["reviews"] = reviews;
        await FireStoreService.updateData("attractions", attractionId,attraction);
        onSuccess();
      }
      catch(e){
        onError(e);
      }
      finally{
        onFinish();
      }
  }
}
