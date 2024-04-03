import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../models/user.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;
  static final db = FirebaseFirestore.instance;

  static Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
    return auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> resetPassword({
    required String email,
  }) {
    return auth.sendPasswordResetEmail(email: email);
  }

  static Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await auth.signInWithCredential(credential);
  }

  static Future<void> createAccount({
    required UserCredential credential,
    String? displayName,
  }) async {
    var user = credential.user!;
    var model = UserModel(
      displayName: displayName,
      email: user.email!,
      uid: user.uid,
    );

    await user.updateDisplayName(displayName);
    return db.collection('users').doc(user.uid).set(model.toJson());
  }

  static Future<UserModel> getUser() async {
    var user = getCurrentUser();
    var userDoc = await db.collection('users').doc(user!.uid).get();
    var userData = userDoc.data();

    var model = UserModel.fromJSON(userData!);
    return model;
  }

  static User? getCurrentUser() => auth.currentUser;

  static Future<void> signOut() => auth.signOut();

  static Future<void> deleteAccount() {
    var user = getCurrentUser()!;
    return user.delete();
  }

  static Stream<User?> listen() => auth.authStateChanges();
}
