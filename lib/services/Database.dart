import 'package:SustainableFashion/models/user.dart';
import 'package:SustainableFashion/models/UserDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference UserDetailsCollection = Firestore.instance.collection('UserDetails');

  Future<void> updateUserData(String name, String email) async {
    return await UserDetailsCollection.document(uid).setData({
      'name': name,
      'email': email,
    });
  }

  // user details list from snapshot
  List<UserDetails> _UserDetailsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return UserDetails(
          name: doc.data['name'] ?? '',
          email: doc.data['email'] ?? '0'
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        email: snapshot.data['email'],
    );
  }

  // get user details stream
  Stream<List<UserDetails>> get UserDetails {
    return UserDetailsCollection.snapshots()
        .map(_UserDetailsListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return UserDetailsCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}
