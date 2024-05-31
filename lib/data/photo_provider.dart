import 'package:flutter/material.dart';

import 'package:image_search_app/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel homeViewModel;
  const PhotoProvider({
    super.key,
    required this.homeViewModel,
    required super.child,
  });
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, "No pixabayApi found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
