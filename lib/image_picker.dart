export 'src/image_picker_none.dart' // Stub implementation
    if (dart.library.io) 'src/image_picker_mobile.dart' // dart:io implementation
    if (dart.library.html) 'src/image_picker_web.dart'; // dart:html implementatio
