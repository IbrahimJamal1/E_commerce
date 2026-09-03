import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/error/handelerror.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String pathimage,
  }) async {
    emit(RegisterLoading());

    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
            'uid': credential.user!.uid,
            'name': name,
            'phone': phone,
            'email': email.trim(),
            'pathimage': pathimage.trim(),
            'createdAt': FieldValue.serverTimestamp(),
          });

      emit(RegisterSuccess("Create Account SUCCESS"));
    } on FirebaseAuthException catch (e) {
      emit(RegisterError(FirebaseErrorHandler.handle(e.code)));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
