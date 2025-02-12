// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? verificationId;
//
//   Future<void> sendOTP(String phoneNumber) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print("Verification Failed: ${e.message}");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         this.verificationId = verificationId;
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         this.verificationId = verificationId;
//       },
//     );
//   }
//
//   Future<bool> verifyOTP(String otp
