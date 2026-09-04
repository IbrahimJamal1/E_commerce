import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryService {
  final Cloudinary cloudinary = Cloudinary.unsignedConfig(
    cloudName: 'bg9fpirs',
  );

  Future<String?> uploadImage(XFile image) async {
    try {
      final response = await cloudinary.unsignedUpload(
        file: image.path,
        uploadPreset: 'flutter_upload',
        resourceType: CloudinaryResourceType.image,
      );

      if (response.isSuccessful) {
        return response.secureUrl;
      }

      throw ('Status: ${response.error}');
    } on DioException catch (e) {
      throw ('Status Code: ${e.response?.statusCode}');
    } catch (e) {
      throw ('Error: $e');
    }
  }
}
