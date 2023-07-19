import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickercontroller extends GetxController{

RxString imagePath =''.obs;
  Future getimage() async{
    final ImagePicker _picker =ImagePicker();
    final image =await _picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      imagePath.value =image.path.toString();
    }
  }
}