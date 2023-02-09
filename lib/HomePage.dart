// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vericekme/models/user_models.dart';
import 'package:vericekme/service/user_sevice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserService service = UserService();
  List<ModelArticles?> data = [];
  @override
  void initState() {
    super.initState();
    service.get().then((value) => {
          if (value != null && value.articles != null)
            {
              setState(() {
                data = value.articles!;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data.length,
        itemBuilder: (context, index) {
          var veri = data[index]!;

          return Card(
            child: SingleChildScrollView(
              child: ListTile(
                title: Column(
                  children: [
                    FadeInImage(
                      image: NetworkImage(veri.urlToImage.toString()),
                      placeholder: AssetImage("assets/1.gif"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return CircularProgressIndicator();
                      },
                      fit: BoxFit.cover,
                    ),
                    Text(
                      veri.title.toString(),
                    )
                  ],
                ),
                subtitle: Column(
                  children: [
                    Text(veri.description.toString()),
                    TextButton(
                        onPressed: () async {
                          await launch(veri.url.toString());
                        },
                        child: Text("Habere Git"))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
