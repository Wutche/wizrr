import 'package:app/common/common.model.dart';
import 'package:app/common/widgets/widget.back_header.dart';
import 'package:app/core/services/service.firebase_auth.dart';
import 'package:app/core/services/service.firestore.dart';
import 'package:app/core/services/service.snackbar.dart';
import 'package:app/features/attractions/attractions.service.dart';
import 'package:app/features/attractions/widgets/attraction.review_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddReview extends StatefulWidget {
  final Map<String,dynamic> attraction;
  final String attractionId;

  const AddReview({
    super.key,
    required this.attraction,
    required this.attractionId,
  });

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  num rating = 1;
  String comment = "";
  bool loading = false;

  setRating(num value){
    setState(() {
      rating = value;
    });
  }

  setComment(String value){
    setState(() {
      comment = value;
    });
  }

  setLoading(bool value){
    setState(() {
      loading = value;
    });
  }


  UserModel getUser(){
    var firebaseUser = FirebaseAuthService.getCurrentUser();
    if(firebaseUser != null) {
      return UserModel(
          email: firebaseUser.email,
          name: firebaseUser.displayName,
          photoURL: firebaseUser.photoURL
      );
    }
    return UserModel(
      email:"N/A",
      name: "N/A",
    );
  }

  handleSubmit() async{
    final newReview = {
      "rating":rating,
      "comment":comment,
      "author":getUser().name?? "Anonymous",
      "photoURL":getUser().photoURL?? "",
      "date":Timestamp.fromDate(DateTime.timestamp())
    };
    setLoading(true);
    await AttractionService.addReview(
        widget.attraction,
        widget.attractionId,
        newReview,
        onSuccess: (){
          setComment("");
          setRating(1);
          context.pop();
        },
        onFinish:()=> setLoading(false),
        onError: (e) => AppSnackBar.showDefaultSnackBar(context, e.toString())
    );
    setLoading(false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackHeader("Add Review"),
            Expanded(
                child: ReviewForm(
                  onSubmit:handleSubmit,
                  rating: rating,
                  setRating: setRating,
                  comment: comment,
                  setComment: setComment,
                  loading: loading,
                ),
            )
          ],
        ))
    );
  }
}
