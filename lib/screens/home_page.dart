import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/apod_pagination_model.dart';
import '../stores/apod_store.dart';

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
                  if (index >= apodStore.apodFuture!.result!.length) {
                    return null;
                  }
                  final apod = apodList[index];
                  return ListTile(
                    title: Text(apod.title),
                    //subtitle: Text(apod.explanation),
                    leading: Image.network(
                      apod.url,
                      height: 200,
                      width: 200,
                    ),
                  );
                },
              );
            default:
              return Container(); // Você pode ajustar isso conforme necessário
          }
        },
      ),
    );
  }
}
