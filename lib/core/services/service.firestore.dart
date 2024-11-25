import 'package:cloud_firestore/cloud_firestore.dart';



class FireStoreService{
  static final _db = FirebaseFirestore.instance;
  static Future<List<Map<String, dynamic>>> getCollections(String collectionName) async{
      var res =  await FireStoreService._db.collection(collectionName).get();
      List<Map<String, dynamic>> dataList= [];
      for(var doc in res.docs){
        var data = doc.data();
        data["id"] = doc.id;
        dataList.add(data);
      }
      return dataList;
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream(String collectionName) {
      return FireStoreService._db.collection(collectionName).snapshots();
  }
  static updateData(String collection,String docId,Map<String,dynamic> data) async{
    await FireStoreService._db.collection(collection).doc(docId).set(data);
  }
}