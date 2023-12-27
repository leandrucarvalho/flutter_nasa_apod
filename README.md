# Flutter NASA APOD

Este projeto Flutter utiliza a API [Astronomy Picture of the Day (APOD)](https://api.nasa.gov/) da NASA para exibir uma lista de imagens astronômicas e vídeos intrigantes. O usuário pode explorar diariamente novas descobertas cósmicas, ver detalhes sobre cada item e desfrutar de conteúdo multimídia fascinante.

## Índice

- [Flutter NASA APOD](#flutter-nasa-apod)
  - [Índice](#índice)
  - [Recursos](#recursos)
  - [Principais Recursos e Tecnologias Utilizadas:](#principais-recursos-e-tecnologias-utilizadas)
  - [Capturas de Tela](#capturas-de-tela)
  - [Pré-requisitos](#pré-requisitos)
  - [Como Iniciar](#como-iniciar)
- [Exemplo de comandos de terminal](#exemplo-de-comandos-de-terminal)

## Recursos

- Lista APOD: Visualize uma lista paginada de imagens e vídeos astronômicos da NASA.
- Detalhes do Item: Toque em qualquer item para obter detalhes, incluindo uma descrição completa e uma visualização em tela cheia.
- Rolagem Infinita: Carregue mais itens à medida que você rola para baixo na lista, mantendo a experiência do usuário fluida.
- Suporte a Mídia: Reproduza vídeos diretamente no aplicativo usando o pacote youtube_player_flutter.

## Principais Recursos e Tecnologias Utilizadas:

- Dart: A linguagem de programação usada para desenvolver aplicativos Flutter.
- Flutter: O framework de desenvolvimento de aplicativos móveis multiplataforma do Google.
- API da NASA APOD: A fonte de dados que fornece imagens e vídeos astronômicos diários.
- GetIt: Um pacote de injeção de dependência utilizado para gerenciar dependências e obter instâncias de serviços em todo o aplicativo.
- MobX: Um pacote de gerenciamento de estado para Flutter, utilizado para gerenciar o estado do aplicativo de forma reativa.
- YouTube Player Flutter: Um pacote para incorporar vídeos do YouTube no aplicativo.

## Capturas de Tela

Inclua capturas de tela ou GIFs mostrando o funcionamento do aplicativo.

## Pré-requisitos

- Flutter SDK
- Dependências específicas do projeto, como plugins ou chaves de API.

## Como Iniciar

1. Clone este repositório: git clone https://github.com/leandrucarvalho/flutter_nasa_apod
2. Navegue até o diretório do projeto: cd flutter-nasa-apod
3. Execute flutter pub get para instalar as dependências.
4. Execute flutter run para iniciar o aplicativo.

```bash
# Exemplo de comandos de terminal
git clone https://github.com/leandrucarvalho/flutter_nasa_apod
cd flutter_nasa_apod
flutter pub get
flutter run
