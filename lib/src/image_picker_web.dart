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
    print('IMAGE PICKER CREATED +++++++++++++++');
    fileUploaded = new StreamController();
    uploadInput = new FileUploadInputElement();
    uploadInput.accept = 'image/*';
    reader = new FileReader();
    print('IMAGE READER CREATED +++++++++++++++');
    uploadInput.onError.listen((event) {
      print('IMAGE ERROR +++++++++++++++');
      print(event);
      print('IMAGE ERROR +++++++++++++++');
    });
    uploadInput.onReset.listen((event) {
      print('IMAGE RESET +++++++++++++++');
      print(event);
      print('IMAGE RESET +++++++++++++++');
    });
    uploadInput.onClick.listen((event) {
      print('IMAGE CLICK +++++++++++++++');
      print(event);
      print('IMAGE CLICK +++++++++++++++');
    });
    uploadInput.onEmptied.listen((event) {
      print('IMAGE onEmptied +++++++++++++++');
      print(event);
      print('IMAGE onEmptied +++++++++++++++');
    });
    uploadInput.onEnded.listen((event) {
      print('IMAGE onEnded +++++++++++++++');
      print(event);
      print('IMAGE onEnded +++++++++++++++');
    });
    uploadInput.onInvalid.listen((event) {
      print('IMAGE onInvalid +++++++++++++++');
      print(event);
      print('IMAGE onInvalid +++++++++++++++');
    });
    uploadInput.onInput.listen((event) {
      print('IMAGE onInput +++++++++++++++');
      print(event);
      print('IMAGE onInput +++++++++++++++');
    });
    uploadInput.onChange.listen((e) {
      print('IMAGE +++++++++++++++');
      print(e);
      print('IMAGE +++++++++++++++');

      final files = uploadInput.files;
      print('FILES +++++++++++++++');
      print(files);
      print('FILES +++++++++++++++');

      if (files.length == 1) {
        reader.onLoadEnd.listen((e) {
          print('FILES LOAD +++++++++++++++');
          print(e);
          print('FILES LOAD +++++++++++++++');
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
