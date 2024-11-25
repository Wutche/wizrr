import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/services/service.snackbar.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('explorer');


class WishlistButton extends StatefulWidget {
  final String id;
  const WishlistButton({
    super.key,
    this.id = ""
  });

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  addToFavourites()async{
    List<String>? favourites = storage.getItem("favourites");
    if(favourites != null){
      await storage.setItem("favourites",[...favourites,widget.id]);
      return;
    }
    storage.setItem("favourites",[widget.id]);
  }

  removeFromFavourites()async{
    List<String>? favourites = storage.getItem("favourites");
    if(favourites != null){
      var updatedFavourites = favourites.where((fav) => fav != widget.id).toList();
      await storage.setItem("favourites",updatedFavourites);
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
         future: storage.ready,
         builder: (context,snapshot){
           if(snapshot.hasData){
             List<String>? data = storage.getItem("favourites");
             if(data != null && data.contains(widget.id)){
               return AppIconButton(tapHandler: ()async{
                 await removeFromFavourites();
                 if(!context.mounted) return;
                 AppSnackBar.showDefaultSnackBar(context, "Attraction removed to favourites");
               },
                   child: Icon(Icons.favorite,color: AppColor.primary)
               );
             }
             return AppIconButton(
                 tapHandler: ()async{
                   await addToFavourites();
                   if(!context.mounted) return;
                   AppSnackBar.showDefaultSnackBar(context, "Attraction added to favourites");
                 },
                 child: Image.asset("assets/icons/heart-plus.png"));
           }
           return Icon(Icons.favorite,color: AppColor.primary,);
         }
       );
    // :
    }
}
