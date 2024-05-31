import 'package:flutter/material.dart';

import 'package:image_search_app/model/photo.dart';
import 'package:image_search_app/ui/home_view_model.dart';
import 'package:image_search_app/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("이미지 검색 앱", style: TextStyle(color: Colors.black)),
          elevation: 0),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      viewModel.fetch(_controller.text);
                    },
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            )),
        Expanded(
          child: GridView.builder(
              itemCount: viewModel.photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
              itemBuilder: (context, index) {
                final photo = viewModel.photos[index];
                return PhotoWidget(
                  photo: photo,
                );
              }),
        )
      ]),
    );
  }
}
