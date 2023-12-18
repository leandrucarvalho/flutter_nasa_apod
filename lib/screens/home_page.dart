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

  @override
  void initState() {
    super.initState();
    apodStore.fetchApod(ApodPaginationModel(count: 10));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APOD List'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          if (apodStore.apodFuture == null) {
            return const Center(
              child: Text('Nenhum dado disponível'),
            );
          }

          switch (apodStore.apodFuture!.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.rejected:
              return Center(
                child: Text('Erro: ${apodStore.apodFuture!.error}'),
              );
            case FutureStatus.fulfilled:
              final apodList = apodStore.apodFuture!.result!;
              return ListView.separated(
                itemCount: apodList.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (context, index) {
                  final apod = apodList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DatailPage(
                              url: apod.url,
                              subtitle: apod.explanation,
                              mediaType: apod.mediaType,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            FutureBuilder<Widget>(
                              future:
                                  buildMediaWidget(apod.mediaType, apod.url),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return snapshot.data ?? Container();
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                            Text(apod.title)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return const Center(
                child: Text("Ocorreu um problema. Tente novamente mais tarde"),
              );
          }
        },
      ),
    );
  }
}
