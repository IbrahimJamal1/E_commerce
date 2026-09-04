import 'package:image_picker/image_picker.dart';

Future<XFile?> profileimage() async {
  final picker = ImagePicker();

  return await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 70,
    maxWidth: 1200,
    maxHeight: 1200,
  );
}

Future<XFile?> paymentimage() async {
  final picker = ImagePicker();
  return await picker.pickImage(source: ImageSource.gallery);
}
