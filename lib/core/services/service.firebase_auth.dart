

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthResponse{
  final User? user;
  final Object? error;
  AuthResponse({
    this.user,
    this.error
  });
}

class FirebaseAuthService{

  static final _auth = FirebaseAuth.instance;

  static Future<AuthResponse> signInUser(String email, String password,{required void Function() onFinish})async{
        try{
          var cred = await FirebaseAuthService._auth.signInWithEmailAndPassword(email: email, password: password);
          var user = cred.user;
          return AuthResponse(user: user);
        }
        catch(e){
          return AuthResponse(error: e);
        }
        finally{
          onFinish();
        }
  }
  static checkAuthStatus(){
    return FirebaseAuthService._auth;
  }

  static User? getCurrentUser(){
    return FirebaseAuthService._auth.currentUser;
  }


  static onAuthStatusChanged({
    required void Function(User?) onFinish,
  }){
    FirebaseAuthService._auth
        .authStateChanges()
        .listen(onFinish);
}

  static logUsersOut(){}

  static signUpUsers({
    required String displayName,
    required String email,
    required String password,
    required Function onFinish,
    required Function(User?) onSuccess,
    required Function(Object) onError
  })
    async{
      try{
        var userCredential = await FirebaseAuthService._auth.createUserWithEmailAndPassword(email: email, password: password);
        await userCredential.user?.updateDisplayName(displayName);
        onSuccess(userCredential.user);
      }
      catch(e){
        if (kDebugMode) {
          print(e);
        }
        onError(e);
      }
      finally{
        onFinish();
      }
  }

  static updatePassword(){}

  static updateProfileName(String displayName, {
    required Function(Object) onError,
    required Function onFinish,
  }) async{
    try{
      var user = FirebaseAuthService._auth.currentUser;
      await user?.updateDisplayName(displayName);
    }
    catch(e){
      onError(e);
    }
    finally{
      onFinish();
    }
  }
  static updateProfile(String displayName,String newEmail, {
    required Function(Object) onError,
    required Function onFinish,
    required Function onSuccess,
  }) async{
    try{
      var user = FirebaseAuthService._auth.currentUser;
      await user?.updateDisplayName(displayName);
      await user?.verifyBeforeUpdateEmail(newEmail);
      onFinish();
      onSuccess();
    }
    catch(e){
      onError(e);
    }
    finally{
      onFinish();
    }
  }

  static forgotPassword(){}

  static resetPassword(){}

  static signOut({
    required void Function(Object) onError,
    required void Function() onSuccess,
  })async{
   try{
     await FirebaseAuthService._auth.signOut();
     onSuccess();
   }
   catch(e){
     onError(e);
   }
  }
}