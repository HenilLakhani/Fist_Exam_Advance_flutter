import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/api_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiController>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Information"),
        centerTitle: true,
      ),
      body: Consumer<ApiController>(
        builder: (context, pro, _) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: pro.post == null
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: pro.post?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('detail_page',
                                  arguments: pro.post?[index]);
                            },
                            child: Card(
                              color: Colors.redAccent,
                              child: ListTile(
                                title: Text("${pro.post?[index].title}"),
                                leading: Text("${pro.post?[index].id}"),
                                subtitle:
                                    Text("${pro.post?[index].release_date}"),
                              ),
                            ),
                          );
                        },
                      )),
          );
        },
      ),
    );
  }
}
