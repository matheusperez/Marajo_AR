# Marajó AR


Pasta e arquivos para visualizar:

Android:

Habilitar o arcore: https://developers.google.com/ar/develop/java/enable-arcore

importar objetos 3d: https://developers.google.com/sceneform/develop/import-assets

Android/app/sampledata (Dentro dessa pasta que vc coloca os objetos 3d)
Android/app/build.gradle (arquivo onde vc vai chamar os objetos para serem gerados .sfb)

lib/app/modules/arview/arcore (tela que visualiza os objetos em 3d)
Plugin do Android: https://pub.dev/packages/arcore_flutter_plugin


IOS:

Só funciona a partir do IOS 11 para cima

Na pasta IOS/Runner vc tem que criar uma pasta chamada models.scnassets. Nessa pasta que vc vai adicionar os objetos 3D (Importante, a pasta deve ser criada dentro do Xcode, se for criada no vscode por exemplo, o IOS não vai reconhecer e o mesmo vale quando for adicionar os objetos)

lib/app/modules/arview/arkit (Tela que visualiza os objetos 3d no IOS)

plugin do IOS: https://pub.dev/packages/arkit_plugin
Esse foi o básico do Android e IOS
Meu código é bem simples, acho que vc consegue entender bem.
