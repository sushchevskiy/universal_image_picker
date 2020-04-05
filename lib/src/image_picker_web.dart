import 'dart:async';
import 'dart:typed_data';

import 'dart:html';
import 'package:image_picker/image_picker.dart';
import 'package:universal_image_picker/src/image_picker_interface.dart';

class UniversalImagePicker implements ImagePickerInterface {
  FileUploadInputElement uploadInput;
  FileReader reader;
  // Uint8List file;
  StreamController<Uint8List> fileUploaded;

  UniversalImagePicker() {
    fileUploaded = new StreamController();
    uploadInput = new FileUploadInputElement();
    uploadInput.accept = 'image/*';
    reader = new FileReader();
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files.length == 1) {
        reader.onLoadEnd.listen((e) {
          // file = reader.result;
          fileUploaded.add(reader.result);
        });
        reader.readAsArrayBuffer(files[0]);
      } else {
        fileUploaded.add(null);
      }
    });
  }

  Future<Uint8List> pickImage(ImageSource source) async {
    uploadInput.click();
    Uint8List image = await fileUploaded.stream.take(1).single;
    fileUploaded.close();
    return image;
  }
}
