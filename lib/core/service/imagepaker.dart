import 'package:image_picker/image_picker.dart';

Future<XFile?> profileimage() async {
  final picker = ImagePicker();

  return await picker.pickImage(
    source: ImageSource.gallery,
  );

}

Future<XFile?> paymentimage() async {
  final picker = ImagePicker();
  return await picker.pickImage(
    source: ImageSource.gallery,
  );
}