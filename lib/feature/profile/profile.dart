import 'package:e_commerce/feature/profile/cubit/cubit/profile_cubit.dart';
import 'package:e_commerce/feature/profile/widget/dataaccount.dart';
import 'package:e_commerce/feature/profile/widget/dataorderuser.dart';
import 'package:e_commerce/feature/profile/widget/headprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProfileError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        if (state is ProfileSuccess) {
          final user = state.user;
          return Scaffold(
            backgroundColor: Color(0xFFF5F9FF),
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight(800)),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  headprofilepage(user),
                  SizedBox(height: 15),
                  dataorder(),
                  SizedBox(height: 15),
                  dataacount(
                    "Personal Information",
                    "name,phone,email",
                    Icon(Icons.person),
                    () {},
                  ),
                  SizedBox(height: 15),
                  dataacount(
                    "My order",
                    "4 Order",
                    Icon(Icons.production_quantity_limits),
                    () {},
                  ),
                  SizedBox(height: 15),
                  dataacount(
                    "Ratiing",
                    "Go To Rate",
                    Icon(Icons.rate_review),
                    () {},
                  ),
                  SizedBox(height: 15),
                  dataacount(
                    "FeedBack",
                    "Go To feedback",
                    Icon(Icons.feedback),
                    () {},
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        }
        return const Scaffold(body: Center(child: Text('No user data')));
      },
    );
  }
}
