import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:image_search_app/data/photo_api_repository.dart';

import '../model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;
  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
