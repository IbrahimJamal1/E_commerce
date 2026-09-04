import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

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

      print('Status: ${response.error}');
      return null;
    } on DioException catch (e) {
      print('Status Code: ${e.response?.statusCode}');
      print('Response: ${e.response?.data}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}