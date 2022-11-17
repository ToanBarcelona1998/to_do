import 'dart:async';

import 'package:flutter/material.dart';

mixin ScreenLoaderMixin<T extends StatefulWidget> on State<T> {
  final loadingController = StreamController<bool>();

  Widget buildLoader() {
    return Container(
      color: Colors.black54,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3,
        ),
      ),
    );
  }

  @override
  void dispose() {
    loadingController.close();

    super.dispose();
  }

  void showLoading() {
    loadingController.add(true);
  }

  void hideLoading() {
    loadingController.add(false);
  }

  Widget builder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        builder(context),
        StreamBuilder(
          stream: loadingController.stream,
          builder: (_, snapshot) => snapshot.data == true
              ? Positioned.fill(
            child: buildLoader(),
          )
              : const SizedBox(),
        ),
      ],
    );
  }
}
