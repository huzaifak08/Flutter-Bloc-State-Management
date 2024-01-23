import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/utils/image_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryPicker);
  }

  void _cameraCapture(
      ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(
      ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(file: file));
  }
}
