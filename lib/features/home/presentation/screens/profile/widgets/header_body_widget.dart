import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings/routes.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../../pick_photo/bloc/pickphoto_bloc.dart';

class HeaderProfileWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  const HeaderProfileWidget(
      {Key? key, required this.imageUrl, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutState) {
          Navigator.pushNamedAndRemoveUntil(context, loginScreen, (_) => false);
        }
      },
      child: SizedBox(
        height: 188,
        width: 116,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<PickPhotoBloc, PickPhotoState>(
              builder: (context, photo) {
                if (photo is PhotoUploaded) {
                  return _profileImage(photo.imageUrl, context,
                      photoName: userName);
                }
                return _profileImage(imageUrl, context, photoName: userName);
              },
            ),
            const SizedBox(
              height: 18,
            ),
            _editProfile(),
            const SizedBox(
              height: 11,
            ),
            Text(
              'Hi there $userName!',
              style: const TextStyle(
                  color: primaryFontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            InkWell(
              onTap: () =>
                  BlocProvider.of<AuthBloc>(context)..add(SignOutEvent()),
              child: const Text(
                'Sign Out',
                style: TextStyle(
                    color: secondaryFontColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileImage(String image, BuildContext context,
      {required String photoName}) {
    return SizedBox(
      height: 102,
      width: 102,
      child: Stack(
        children: [
          ClipRRect(
            child: CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: image,
              fit: BoxFit.cover,
              height: 110,
              width: 110,
              placeholder: (context, url) => const LoadingWidget(),
              errorWidget: (context, url, error) => Container(
                color: Colors.black,
              ),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.6),
                ],
                stops: const [0.5, 0.6],
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) =>
                      showBottomSheet(context, photoName: photoName),
                );
              },
              borderRadius: BorderRadius.circular(50),
              customBorder:
                  const CircleBorder(side: BorderSide(color: mainColor)),
              splashColor: mainColor,
              child: const Icon(
                Icons.camera_alt,
                color: placeholderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showBottomSheet(BuildContext context, {required String photoName}) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Choose Profile Photo',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => context.read<PickPhotoBloc>()
                  ..add(PickinigPhotoFromGalleryEvent(imageName: photoName)),
                child: Row(
                  children: const [
                    Icon(Icons.image),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Gallery'),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () => BlocProvider.of<PickPhotoBloc>(context)
                  ..add(PickinigPhotoFromCameraEvent(imageName: photoName)),
                child: Row(
                  children: const [
                    Icon(Icons.camera_alt),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Camera'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _editProfile() {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.edit,
            size: 14,
            color: mainColor,
          ),
          SizedBox(
            width: 6.8,
          ),
          Text(
            'Edit Profile',
            style: TextStyle(
                color: mainColor, fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
