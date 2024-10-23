import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../dataFile/data_file.dart';
import '../model/popular_model.dart';
import '../model/release_model.dart';

class IntroController extends GetxController {
  RxInt position = 0.obs;

  onChange(RxInt value) {
    position.value = value.value;
    update();
  }
}

class LoginController extends GetxController with GetTickerProviderStateMixin {
  RxBool select = false.obs;

  onValueChange() {
    if (!select.value) {
      select = true.obs;
    } else {
      select = false.obs;
    }
    update();
  }
}

class HomeController extends GetxController {
  RxInt index = 0.obs;

  onChange(RxInt value) {
    index.value = value.value;
    update();
  }
}

class HomeScreenController extends GetxController {
  RxInt index = 0.obs;

  indexChange(RxInt value) {
    index.value = value.value;
    update();
  }
}

class Search1Controller extends GetxController {
  List<String> searchList = [
    "You're Wrong About",
    "Slow Burn",
    "Discover Your True Self"
  ];

  itemRemove(int index) {
    searchList.removeAt(index);
    update();
  }

// onItemChanged(String value) {
//   searchList = searchList
//       .where((element) => element.toLowerCase().contains(value.toLowerCase()))
//       .toList();
//   update();
// }
}

class FilterController extends GetxController {
  RxInt select = 0.obs;
  RxInt subjectSelect = 0.obs;

  selectChange(int value) {
    select.value = value;
    update();
  }

  subjectChange(int value) {
    subjectSelect.value = value;
    update();
  }
}

class ProfileController extends GetxController {
  RxBool edit = false.obs;

  File? image;
  RxString imagePath = ''.obs;
  final _picker = ImagePicker();

  getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath(pickedFile.path);
      update();
    } else {}
  }

  editchange() {
    edit.value = edit.value ? false : true;
    update();
  }

  editFalse() {
    edit.value = false;
    update();
  }
}

class DownloadController extends GetxController {
  RxBool list = false.obs;
  List<ModelPopular> downloadLists = DataFile.downloadList;

  getList(bool value) {
    list.value = value;
    update();
  }

  removeItem(int index) {
    downloadLists.removeAt(index);
    update();
  }
}

class LibraryController extends GetxController {
  List<ModelRelease> libraryLists = DataFile.libraryList;

  removeItem(int index) {
    libraryLists.removeAt(index);
    update();
  }
}
