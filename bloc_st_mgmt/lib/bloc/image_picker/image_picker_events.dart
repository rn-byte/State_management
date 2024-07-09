import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();

  @override
  List<Object?> get props => [];
}

class CameraImageCapture extends ImagePickerEvents {}

class GalleryImageCapture extends ImagePickerEvents {}
