import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_events.dart';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_st_mgmt/utils/image/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraImageCapture>(_cameraPicker);
    on<GalleryImageCapture>(_galleryPicker);
  }

  void _cameraPicker(
      CameraImageCapture events, Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(
      GalleryImageCapture events, Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
