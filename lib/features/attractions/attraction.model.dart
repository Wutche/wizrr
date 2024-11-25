
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String author;
  final num rating;
  final String photoURL;
  final String comment;
  final Timestamp? date;

  ReviewModel(Map<String,dynamic> reviewDetails):
    rating = reviewDetails["rating"],
    photoURL = reviewDetails["photoURL"],
    author = reviewDetails["author"],
    comment = reviewDetails["comment"],
    date = reviewDetails["date"]
  ;
}

class AttractionModel{
  final String name;
  final String image;
  final String description;
  final List<ReviewModel> reviews;
  final String? address;

  AttractionModel(Map<String,dynamic> attractionData, List<ReviewModel> attractionReviews):
    name = attractionData["name"],
    image = attractionData["image"],
    description = attractionData["description"],
    reviews = attractionReviews,
    address = attractionData["short_address"]
  {
    print(attractionData);
  }
}