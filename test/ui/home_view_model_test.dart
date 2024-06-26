import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/data/photo_api_repository.dart';

import 'package:image_search_app/model/photo.dart';
import 'package:image_search_app/ui/home_view_model.dart';

void main() {
  test("Check stream data is not error", () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    viewModel.fetch('apple');
    viewModel.fetch('apple');

    expect(viewModel.photos,
        emitsInOrder([isA<List<Photo>>(), isA<List<Photo>>()]));
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 195893,
    "pageURL": "https://pixabay.com/en/blossom-bloom-flower-195893/",
    "type": "photo",
    "tags": "blossom, bloom, flower",
    "previewURL":
        "https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg",
    "previewWidth": 150,
    "previewHeight": 84,
    "webformatURL": "https://pixabay.com/get/35bbf209e13e39d2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 360,
    "largeImageURL": "https://pixabay.com/get/ed6a99fd0a76647_1280.jpg",
    "fullHDURL": "https://pixabay.com/get/ed6a9369fd0a76647_1920.jpg",
    "imageURL": "https://pixabay.com/get/ed6a9364a9fd0a76647.jpg",
    "imageWidth": 4000,
    "imageHeight": 2250,
    "imageSize": 4731420,
    "views": 7671,
    "downloads": 6439,
    "likes": 5,
    "comments": 2,
    "user_id": 48777,
    "user": "Josch13",
    "userImageURL":
        "https://cdn.pixabay.com/user/2013/11/05/02-10-23-764_250x250.jpg",
  }
];
