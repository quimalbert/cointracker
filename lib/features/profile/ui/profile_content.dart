import 'dart:io';

import 'package:cointracker/features/login/ui/login_page.dart';
import 'package:cointracker/features/profile/application/select_photo.dart';
import 'package:cointracker/features/profile/ui/widgets/change_password_confirmation.dart';
import 'package:cointracker/features/profile/ui/widgets/enable_biometric_confirmation.dart';
import 'package:cointracker/features/profile/ui/widgets/profile_avatar_button.dart';
import 'package:cointracker/features/profile/ui/widgets/profile_card.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:cointracker/shared/ui/widgets/scaffold_snackbar.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../shared/application/read_user_data.dart';
import '../../../shared/application/write_user_data.dart';
import '../application/take_photo.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  late String _textMessage, _titleMessage;

  File? imgUrl;
  late Map<String, dynamic> _userMap;

  final SelectPhotoUseCase _selectPhotoUseCase = _getSelectPhotoUseCase();
  final TakePhotoUseCase _takePhotoUseCase = _getTakePhotoUseCase();
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _isLoading = true;

  late bool _isBiometricEnabled;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    ReadUserDataUseCase().call().then((value) => setState(() {
          _userMap = value;
          _isLoading = false;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CustomCircularProgressIndicator());
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
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
                        physics: const BouncingScrollPhysics(),
                        children: [
                          AvatarButton(
                            buttonText: "Select from Gallery",
                            buttonIcon: const Icon(
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
                            buttonIcon: const Icon(
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
                backgroundImage: _userMap["profile_picture_url"] == null
                    ? Image.asset('assets/images/default_profile.png').image
                    : FileImage(File(_userMap["profile_picture_url"]!)),
                radius: 75,
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _userMap["email"]!,
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
            auth.sendPasswordResetEmail(email: _userMap["email"]!);
            showDialog(
                context: context,
                builder: (context) => const ChangePasswordConfirmation());
            print("Changed password");
          },
        ),
        ProfileCard(
          buttonText: 'Enable Biometric Login',
          onPressed: () {
            if (isBiometricEnabled()) {
              _isBiometricEnabled = false;
              _titleMessage = "Disabled!";
              _textMessage = "Biometric login has been disabled";
            } else {
              _isBiometricEnabled = true;
              _textMessage = "Biometric login has been enabled";
              _titleMessage = "Enabled!";
            }
            showDialog(
                context: context,
                builder: (context) => EnableBiometricConfirmation(
                      textMessage: _textMessage,
                      titleText: _titleMessage,
                    ));
            WriteUserDataUseCase().call(
                email: _userMap["email"],
                pictureURL: _userMap["pictureURL"],
                isBiometricEnabled: _isBiometricEnabled);
          },
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
        Center(
          child: QrImage(
            data: _userMap["email"],
            version: QrVersions.auto,
            size: 150.0,
          ),
        ),
      ],
    );
  }

  bool isBiometricEnabled() {
    ReadUserDataUseCase().call().then((value) => setState(() {
          _userMap = value;
        }));
    return _userMap["isBiometricEnabled"];
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
