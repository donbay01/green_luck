import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../models/user.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;
  static final db = FirebaseFirestore.instance;
  static final messaging = FirebaseMessaging.instance;

  static String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> listenUser(
      String uid,
      ) =>
      db.collection('users').doc(uid).snapshots();

  static Future<String?> getToken() async {
    var perm = await messaging.requestPermission();
    if (perm.authorizationStatus == AuthorizationStatus.authorized) {
      var token = await messaging.getToken();
      return token;
    }

    return null;
  }

  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static Future<UserCredential> appleAuth() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return await auth.signInWithCredential(oauthCredential);
  }

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

  static Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await auth.signInWithCredential(credential);
    }

    return null;
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

  static updateUser(Map<String, dynamic> json) {
    var user = getCurrentUser()!;
    return db.collection('users').doc(user.uid).update(json);
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
