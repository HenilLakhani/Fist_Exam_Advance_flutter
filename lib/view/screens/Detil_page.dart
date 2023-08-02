import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details page",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Text(data[0]['title']),
          )
        ],
      ),
    );
  }
}
