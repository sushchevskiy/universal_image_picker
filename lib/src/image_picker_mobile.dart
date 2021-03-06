import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:universal_image_picker/src/image_picker_interface.dart';

class UniversalImagePicker implements ImagePickerInterface {
  Future<Uint8List> pickImage(ImageSource source, {String fileType}) async {
    print('IMAGE PICKER MOBILE +++++++++++++++');
    final file = await ImagePicker.pickImage(source: source);
    return file?.readAsBytesSync();
  }
}
