import 'package:app/common/common.model.dart';
import 'package:app/common/layouts/layout.home.dart';
import 'package:app/common/widgets/widget.back_header.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.input.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.firebase_auth.dart';
import 'package:app/core/services/service.snackbar.dart';
import 'package:app/features/auth/widgets/auth.input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool readOnly = true;
  bool loading = false;
  Map<String,String> profileData = {
    "name":"",
    "email":"",
  };

  setLoading(bool value){
    setState(() {
      loading = value;
    });
  }
  handleInput(String key, String value){
    setState(() {
      profileData={
        ...profileData,
        key:value
      };
    });
  }

  toggleEdit(bool value){
    setState(() {
      readOnly = value;
    });
  }


  UserModel getUser(){
    var firebaseUser = FirebaseAuthService.getCurrentUser();
    if(firebaseUser != null) {
      emailController.text = firebaseUser.email ?? "N/A";
      nameController.text = firebaseUser.displayName ?? "N/A";

      profileData = {
        "name":firebaseUser.displayName ?? "N/A",
        "email":firebaseUser.email ?? "N/A",
      };

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

  updateProfile()async{
    setLoading(true);
    FirebaseAuthService.updateProfile(
        profileData["name"] as String,
        profileData["email"] as String,
        onError: (e)=>AppSnackBar.showDefaultSnackBar(context,e.toString()),
        onFinish: (){
          setLoading(false);
          toggleEdit(false);
        },
        onSuccess: (){
          AppSnackBar.showDefaultSnackBar(context,"Profile Updated Successfully");
        }
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        backgroundColor: AppColor.white,
        activePage: "profile",
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 AppIconButton(tapHandler: (){
                   context.go("/");
                 }, child: const Icon(Icons.chevron_left,size: 28,)),
                 AppIconButton(
                     tapHandler: ()async{
                       await FirebaseAuthService.signOut(
                           onError: (e)=>AppSnackBar.showDefaultSnackBar(context, e.toString()),
                           onSuccess: ()=>context.go("/login")
                       );
                     },
                     child: Paragraph(
                         "Logout",
                         color: AppColor.primary,
                        size: ParagraphSizes.lg,
                        weight: ParagraphWeight.medium,
                     )
                 )
               ],
             ),
              const SizedBox(height: 32),
              Expanded(child: Column(
                children: [
                  Center(
                   child: Stack(
                     children: [
                        CircleAvatar(
                         radius: 60,
                         backgroundColor: AppColor.darkShade[100],
                         child: Icon(Icons.person,color: AppColor.inactive,size: 80,),
                       ),
                       Positioned(
                         bottom: -8,
                         right: -8,
                         child: AppIconButton(
                             tapHandler: (){},
                             child: CircleAvatar(
                               backgroundColor: AppColor.white,
                               child: Icon(Icons.camera_alt,color: AppColor.inactive),
                             )
                         ),
                       )
                     ],
                   ),
                  ),
                  const SizedBox(height: 8),
                  Paragraph(
                      profileData["name"]??"N/A",
                      weight: ParagraphWeight.semiBold,
                      size: ParagraphSizes.x3l,
                      color: AppColor.dark
                  ),
                  Paragraph(
                      profileData["email"]??"N/A",
                      weight: ParagraphWeight.light,
                      size: ParagraphSizes.md,
                      color: AppColor.dark
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Paragraph(
                          "Name",
                          color: AppColor.dark,
                          weight: ParagraphWeight.medium,
                      ),
                      const SizedBox(height: 4),
                      TextInputField(
                          controller: nameController,
                          readOnly: readOnly,
                          setInput: (value){
                            handleInput("name", value);
                          },
                          placeholder: "Name",
                          icon: const Icon(Icons.abc_outlined)
                      ),
                      const SizedBox(height: 32),
                      Paragraph(
                          "Email",
                          color: AppColor.dark,
                          weight: ParagraphWeight.medium,
                      ),
                      const SizedBox(height: 4),
                      TextInputField(
                          readOnly: readOnly,
                          controller: emailController,
                          setInput: (value){
                            handleInput("email", value);
                          },
                          placeholder: "Email",
                          icon: const Icon(Icons.alternate_email)
                      )
                    ],
                  )
                ],
              )),
             readOnly
                 ? AppButton(action: ()async{
                      toggleEdit(false);
                   },
                       color: AppColor.primary,
                       child: Paragraph(
                           "Edit Profile",
                           size: ParagraphSizes.lg,
                           weight: ParagraphWeight.medium,
                           color: AppColor.white
                       )
                   )
                 : AppButton(action: ()async{
                    if(!loading){
                      await updateProfile();
                    }
                   },
                       color: AppColor.primary,
                       child: Paragraph(
                           loading?"Saving...":"Save",
                           size: ParagraphSizes.lg,
                           weight: ParagraphWeight.medium,
                           color: AppColor.white
                       )
                  )
            ],
          ),
        )
    );
  }
}
