import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  await GoogleSignIn.instance.initialize();

  final GoogleSignInAccount googleUser = await GoogleSignIn.instance
      .authenticate();

  final GoogleSignInAuthentication googleAuth = googleUser.authentication;

  final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

  UserCredential result = await FirebaseAuth.instance.signInWithCredential(
    credential,
  );

  await FirebaseFirestore.instance
      .collection("users")
      .doc(result.user!.uid)
      .set({
        "name": result.user!.displayName ?? "",
        "mail": result.user!.email ?? "",
        "phone": result.user!.phoneNumber ?? "",
        "pathimage": result.user!.photoURL ?? "",
      }, SetOptions(merge: true));

  return result;
}
