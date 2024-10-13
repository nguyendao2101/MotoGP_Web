import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/admin/view/home_screen_view.dart';
import 'package:moto_gp_web/view/home_screen_view.dart';
import 'package:moto_gp_web/view/login_view.dart';

class FirAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(
    String email,
    String passWord,
    String entryPassword,
    String hoTen,
    String addRess,
    String sex,
    String role, // Nhận tham số role
    Function onSuccess,
    Function(String) onRegisterError,
  ) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: passWord)
        .then((user) {
      if (user.user != null) {
        _createUser(user.user!.uid, hoTen, addRess, sex, role, onSuccess);
      }
    }).catchError((err) {
      if (err is FirebaseAuthException) {
        if (err.code == 'weak-password') {
          Get.dialog(AlertDialog(
            title: const Text('Error'),
            content: const Text('Mật khẩu quá đơn giản'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'),
              )
            ],
          ));
        } else if (err.code == 'email-already-in-use') {
          Get.dialog(AlertDialog(
            title: const Text('Error'),
            content: const Text('Email này đã tồn tại'),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK'))
            ],
          ));
        } else {
          _onSignUpErr(err.code, onRegisterError);
        }
      }
    });
  }

  static Future<void> signInWithEmailAndPassword(
      String email, String passWord) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord);

      if (credential.user != null) {
        final userSnapshot = await FirebaseDatabase.instance
            .ref('users/${credential.user!.uid}')
            .once();

        final userData = userSnapshot.snapshot.value as Map<dynamic, dynamic>?;

        if (userData != null) {
          final userRole = userData['role'];
          if (userRole == 'admin') {
            Get.offAll(() => const HomeScreenAmin());
          } else {
            Get.offAll(() => const HomeScreen());
          }
        } else {
          print('Không tìm thấy dữ liệu người dùng.');
        }
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        Get.dialog(AlertDialog(
          title: const Text('Error'),
          content: const Text('No user found for that email'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            )
          ],
        ));
      } else if (err.code == 'wrong-password') {
        Get.dialog(AlertDialog(
          title: const Text('Error'),
          content: const Text('Wrong password provided for that user'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'))
          ],
        ));
      } else {
        Get.dialog(AlertDialog(
          title: const Text('Error'),
          content: Text(err.message ?? "Something went wrong..."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'))
          ],
        ));
      }
    }
  }

  void _createUser(String userId, String hoTen, String addRess, String sex,
      String role, Function onSuccess) {
    // Sử dụng role từ tham số truyền vào
    var user = {
      'HoTen': hoTen,
      'AddRess': addRess,
      'Sex': sex,
      'role': role, // Sử dụng role truyền vào
    };
    var ref = FirebaseDatabase.instance.ref().child('users');
    ref.child(userId).set(user).then((_) {
      onSuccess();
    }).catchError((err) {
      print("Error: $err");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("SignUp failed, please try again");
        break;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    Get.to(() => const LoginView());
  }
}
