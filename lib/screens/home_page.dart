import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_nasa_apod/models/apod_pagination_model.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../di/di_setup.dart';
import '../stores/apod_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apodStore = GetIt.I<ApodStore>();
    setupLocator();

    return Scaffold(
      appBar: AppBar(
        title: const Text('APOD List'),
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
              return ListView.builder(
                itemCount: apodList.length,
                itemBuilder: (context, index) {
                  if (index >= apodStore.apodFuture!.result!.length) {
                    return null; // Se index for maior ou igual à quantidade disponível, retorne nulo
                  }
                  final apod = apodList[index];
                  return ListTile(
                    title: Text(apod.title),
                    subtitle: Text(apod.explanation),
                    leading: Image.network(apod.url),
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
