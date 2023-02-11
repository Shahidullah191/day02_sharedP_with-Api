import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ImagePickerController extends GetxController{
  RxString imagePathCamera = ''.obs;
  RxString imagePathGallery = ''.obs;

  Future getImageFromCamera() async{
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      imagePathCamera.value = image.path.toString();
    }
  }

  Future getImageFromGallery() async{
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      imagePathGallery.value = image.path.toString();
    }
  }
}