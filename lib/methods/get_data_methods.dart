import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> getUserInfo() async {
  var user = FirebaseAuth.instance.currentUser;
  var email = user?.email;

  if (email == null) return null;

  var doc = FirebaseFirestore.instance.collection("user");
  var querySnapshot = await doc.where("email", isEqualTo: email).limit(1).get();

  if (querySnapshot.docs.isNotEmpty) {
    var userName = querySnapshot.docs.first.data()["user name"] as String;
    return userName;
  }

  return null;
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getMovies() async {
  DocumentSnapshot docSnapshot =
      await _firestore.collection('movies').doc('movies').get();

  if (docSnapshot.data() != null && docSnapshot.exists) {
    final data = docSnapshot.data() as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(data["movies list"]);
  } else {
    return [];
  }
}

Future<Map<String, dynamic>> getHalls() async {
  QuerySnapshot snapshot = await _firestore.collection('halls').get();
  Map<String, dynamic> halls = {};
  for (var doc in snapshot.docs) {
    halls[doc.id] = doc.data();
  }
  return halls;
}
