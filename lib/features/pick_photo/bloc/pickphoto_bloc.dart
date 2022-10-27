import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

import '../../../core/injection_container.dart';
import '../../home/presentation/blocs/user_info/user_info_cubit.dart';
import '../domain/uses_case/pick_image_from_camera.dart';
import '../domain/uses_case/pick_image_from_gallery.dart';
import '../domain/uses_case/upload_image_to_firestore.dart';

part 'pickphoto_event.dart';
part 'pickphoto_state.dart';

class PickPhotoBloc extends Bloc<PickPhotoEvent, PickPhotoState> {
  PickImageFromCameraUseCase cameraUseCase;
  PickImageFromGalleryUseCase galleryUseCase;
  UploadImageToFireStorgeUseCase uploadImageToFireStorgeUseCase;
  PickPhotoBloc(
      {required this.cameraUseCase,
      required this.galleryUseCase,
      required this.uploadImageToFireStorgeUseCase})
      : super(PickPhotoInitial()) {
    // on<PickinigPhotoFromGalleryEvent>();
    on<PickinigPhotoFromCameraEvent>(_pickingFromCameraEvent);
    on<PickinigPhotoFromGalleryEvent>(_pickingFromGalleryEvent);

    //  on<PickPhotoEvent>((event, emit) async {
    //     if (event is PickinigPhotoFromCameraEvent) {
    //       final result = await cameraUseCase();
    //       result.fold(
    //           (failur) async => emit(PhotoPickError(message: failur.message)),
    //           (result) async {
    //         emit(PhotoPicked());
    //         final image =
    //             await uploadImageToFireStorgeUseCase(imageName: event.imageName);

    //         image.fold(
    //             (failur) async => emit(PhotoPickError(message: failur.message)),
    //             (imageUrl) async {
    //           await inj<UserInfoCubit>().updateUserImage(imageUrl);
    //           emit(PhotoUploaded(imageUrl: imageUrl));
    //         });
    //       });
    //     }
    //     if (event is PickinigPhotoFromGalleryEvent) {
    //       final result = await galleryUseCase();
    //       result.fold((failur) => emit(PhotoPickError(message: failur.message)),
    //           (r) async {
    //         emit(PhotoPicked());
    //         final image =
    //             await uploadImageToFireStorgeUseCase(imageName: event.imageName);

    //         image.fold((l) => emit(PhotoPickError(message: l.message)),
    //             (imageUrl) {
    //           inj<UserInfoCubit>().updateUserImage(imageUrl);
    //           emit(PhotoUploaded(imageUrl: imageUrl));
    //         });
    //       });
    //     }
    //   });
  }
  Future<void> _pickingFromCameraEvent(
      PickinigPhotoFromCameraEvent event, Emitter<PickPhotoState> emit) async {
    final result = await cameraUseCase();
    await result
        .fold((failur) async => emit(PhotoPickError(message: failur.message)),
            (result) async {
      emit(PhotoPicked());
      final image =
          await uploadImageToFireStorgeUseCase(imageName: event.imageName);

      await image
          .fold((failur) async => emit(PhotoPickError(message: failur.message)),
              (imageUrl) async {
        await inj<UserInfoCubit>().updateUserImage(imageUrl);
        emit(PhotoUploaded(imageUrl: imageUrl));
      });
    });
  }

  Future<void> _pickingFromGalleryEvent(
      PickinigPhotoFromGalleryEvent event, Emitter<PickPhotoState> emit) async {
    final result = await galleryUseCase();
    await result
        .fold((failur) async => emit(PhotoPickError(message: failur.message)),
            (r) async {
      emit(PhotoPicked());
      final image =
          await uploadImageToFireStorgeUseCase(imageName: event.imageName);
      await image.fold((l) async => emit(PhotoPickError(message: l.message)),
          (imageUrl) {
        inj<UserInfoCubit>().updateUserImage(imageUrl);
        //emit(PhotoLoading());
        emit(PhotoUploaded(imageUrl: imageUrl));
      });
    });
  }
}
