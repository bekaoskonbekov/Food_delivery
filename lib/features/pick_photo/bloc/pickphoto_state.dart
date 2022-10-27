part of 'pickphoto_bloc.dart';

@immutable
abstract class PickPhotoState extends Equatable {}

class PickPhotoInitial extends PickPhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoPicked extends PickPhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoLoading extends PickPhotoState{
  @override
  List<Object?> get props => [];
}
class PhotoPickError extends PickPhotoState {
  final String message;

  PhotoPickError({required this.message});

  @override
  List<Object?> get props => [message];
}

class PhotoUploaded extends PickPhotoState {
  final String imageUrl;

  PhotoUploaded({required this.imageUrl});
  @override
  List<Object?> get props => [imageUrl];
}

