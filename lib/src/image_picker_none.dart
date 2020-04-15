import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:universal_image_picker/src/image_picker_interface.dart';

class UniversalImagePicker implements ImagePickerInterface {
  Future<Uint8List> pickImage(ImageSource source) async {
    print('IMAGE PICKER STUB +++++++++++++++');
    throw UnimplementedError();
  }
}
