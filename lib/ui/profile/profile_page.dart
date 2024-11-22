import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/profile_bloc/profile_bloc.dart';
import 'package:local_events/blocs/profile_bloc/profile_event.dart';
import 'package:local_events/blocs/profile_bloc/profile_state.dart';
import 'package:local_events/model/profile.dart';
import 'package:local_events/services/firebase_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(FirebaseService()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return _ProfileForm(profile: state.profile);
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("No profile data available"));
          },
        ),
      ),
    );
  }
}

class _ProfileForm extends StatelessWidget {
  final Profile profile;

  const _ProfileForm({required this.profile});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: profile.name);
    final emailController = TextEditingController(text: profile.email);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final newProfile = Profile(
                id: profile.id,
                name: nameController.text,
                email: emailController.text,
                imagePath: '',
              );
              BlocProvider.of<ProfileBloc>(context)
                  .add(UpdateProfile(newProfile));
            },
            child: const Text('Save Profile'),
          ),
        ],
      ),
    );
  }
}
