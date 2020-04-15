import 'dart:async';
import 'dart:html';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:universal_image_picker/src/image_picker_interface.dart';

class UniversalImagePicker implements ImagePickerInterface {
  Future<Uint8List> pickImage(ImageSource source) async {
    final completer = Completer<Uint8List>();

    final InputElement uploadInput = querySelector('#fileloader');
    uploadInput.value = '';
    uploadInput.accept = 'image/*';
    uploadInput.click();
    uploadInput.onChange.first.then((e) {
      final files = uploadInput.files;
      if (files.length != 1) {
        completer.complete(null);
        return;
      }
      final file = files[0];
      final reader = FileReader();

      reader.onLoadEnd.listen((e) {
        completer.complete(reader.result);
      });
      reader.readAsArrayBuffer(file);
    });
    return completer.future;
  }
}
