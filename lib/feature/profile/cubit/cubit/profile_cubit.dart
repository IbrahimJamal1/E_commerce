import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/profile/getuserbyid.dart';
import 'package:e_commerce/feature/profile/module/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        emit(ProfileError('User is not logged in'));
        return;
      }

      final UserModel user = await getUserProfile(currentUser.uid);

      emit(ProfileSuccess(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}