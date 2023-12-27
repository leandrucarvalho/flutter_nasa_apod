import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/apod_pagination_model.dart';
import '../stores/apod_store.dart';
import '../widgets/build_media_custom.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apodStore = GetIt.I<ApodStore>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    apodStore.fetchApod(ApodPaginationModel(count: 10));
    _scrollController.addListener(() {
      // Verifica se o usuário chegou ao final da lista
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Carrega mais itens
        apodStore.fetchMoreApod();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "APOD List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Observer(builder: (context) {
        if (apodStore.apodList.isEmpty) {
          return const Center(
            child: Text('Nenhum dado disponível'),
          );
        }

        return ListView.separated(
          controller: _scrollController,
          itemCount: apodStore.apodList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemBuilder: (context, index) {
            final apod = apodStore.apodList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DatailPage(
                        url: apod.url ?? "",
                        subtitle: apod.explanation ?? "",
                        mediaType: apod.mediaType ?? "",
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      FutureBuilder<Widget>(
                        future: buildMediaWidget(
                            apod.mediaType ?? "", apod.url ?? ""),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return snapshot.data ?? Container();
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                      Text(apod.title ?? "")
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
