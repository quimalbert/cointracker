import 'dart:io';

import 'package:cointracker/features/login/ui/login_page.dart';
import 'package:cointracker/features/profile/application/select_photo.dart';
import 'package:cointracker/features/profile/ui/widgets/change_password_confirmation.dart';
import 'package:cointracker/features/profile/ui/widgets/profile_avatar_button.dart';
import 'package:cointracker/features/profile/ui/widgets/profile_card.dart';
import 'package:cointracker/shared/ui/widgets/scaffold_snackbar.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../application/take_photo.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);
  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  File? imgUrl;
  SelectPhotoUseCase _selectPhotoUseCase = _getSelectPhotoUseCase();
  TakePhotoUseCase _takePhotoUseCase = _getTakePhotoUseCase();
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BottomSheet(
          onClosing: () {},
          builder: (context) => Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  elevation: defaultElevation,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) => SizedBox(
                      height: 290,
                      child: ListView(
                        children: [
                          AvatarButton(
                            buttonText: "Select from Gallery",
                            buttonIcon: Icon(
                              Icons.photo,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            onPressed: () {
                              print('0');
                              try {
                                _selectPhotoUseCase().then((value) {
                                  setState(() {
                                    imgUrl = value;
                                  });
                                });
                              } catch (e) {
                                scaffoldSnackBar(
                                  context: context,
                                  text: 'error',
                                  isError: true,
                                );
                              }
                            },
                          ),
                          AvatarButton(
                            buttonText: "Take a beautiful Photo",
                            buttonIcon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            onPressed: () {
                              _takePhotoUseCase().then((value) {
                                setState(() {
                                  imgUrl = value;
                                });
                              });

                              print(0);
                            },
                          ),
                        ],
                      )));
            }, // Image tapped
            child: Center(
              child: CircleAvatar(
                backgroundImage: user.photoURL == null
                    ? Image.asset('assets/images/default_profile.png').image
                    : FileImage(imgUrl!),
                radius: 75,
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            user.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ProfileCard(
          buttonText: 'Change Password',
          onPressed: () {
            auth.sendPasswordResetEmail(email: user.email!);
            showDialog(
                context: context,
                builder: (context) => ChangePasswordConfirmation());
            print("Changed password");
          },
        ),
        ProfileCard(
          buttonText: 'Enable Biometric Login',
          onPressed: () {},
        ),
        ProfileCard(
          buttonText: 'Dark Mode',
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginPage.routeID);
            },
            child: const Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print("Generate QR");
            },
            child: Text("hola"),
          ),
        )
      ],
    );
  }
}

SelectPhotoUseCase _getSelectPhotoUseCase() {
  SelectPhotoUseCase _selectPhotoUseCase = SelectPhotoUseCase();
  return _selectPhotoUseCase;
}

TakePhotoUseCase _getTakePhotoUseCase() {
  TakePhotoUseCase _takePhotoUseCase = TakePhotoUseCase();
  return _takePhotoUseCase;
}
