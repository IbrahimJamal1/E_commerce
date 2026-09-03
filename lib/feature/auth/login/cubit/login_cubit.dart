import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/error/handelerror.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess('Login Success'));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(FirebaseErrorHandler.handle(e.code)));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetLoading());

    try {
      await auth.sendPasswordResetEmail(email: email.trim());

      emit(ResetSuccess('Reset Password Email Sent'));
    } on FirebaseAuthException catch (e) {
      emit(ResetError(FirebaseErrorHandler.handle(e.code)));
    } catch (e) {
      emit(ResetError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      emit(LoginError(FirebaseErrorHandler.handle(e.code)));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
