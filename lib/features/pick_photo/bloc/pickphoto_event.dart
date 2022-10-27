part of 'pickphoto_bloc.dart';

@immutable
abstract class PickPhotoEvent extends Equatable {}

class PickinigPhotoFromCameraEvent extends PickPhotoEvent {
  final String imageName;

  PickinigPhotoFromCameraEvent({
    required this.imageName,
  });

  @override
  List<Object?> get props => [
        imageName,
      ];
}

class PickinigPhotoFromGalleryEvent extends PickPhotoEvent {
  final String imageName;

  PickinigPhotoFromGalleryEvent({
    required this.imageName,
  });

  @override
  List<Object?> get props => [
        imageName,
      ];
}
