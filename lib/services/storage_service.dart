import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  //create a firebase storage instance
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  //function to upload image to firebase storage and return the download url

  Future<String> uploadImage({
    required String folderName,
    required bool isPost,
    required Uint8List file,
  }) async {
    //create a reference for the image here we also select the correct folder
    Reference ref = _storage
        .ref()
        .child(folderName)
        .child(_auth.currentUser!.uid);

    //if this is a post add another id
    if (isPost) {
      String postId = const Uuid().v4();
      ref = ref.child(postId);
    }
    // post id >> posts >> postId >> 121 1212 121 121
    // upload the image to firebase storage
    UploadTask uploadTask = ref.putData(file);

    //get the snapshot of the upload task
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
