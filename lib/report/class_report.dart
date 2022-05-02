import 'dart:io';

import 'abstract_report.dart';

import '../files_extencions/class_files_extensions.dart';

class Report extends ReportBase {
  const Report({
    required int allLinesProject,
    required Map<String, int> typeFilesAndLines,
    required List<File> allFiles,
    required List<Directory> allDirectorys,
    required List<String> allImages,
    required List<String> allAudios,
    required List<String> allVideos,
    required int numberOfUnrecognizedFiles,
  }) : super(
            typeFilesAndLines: typeFilesAndLines,
            allAudios: allAudios,
            allFiles: allFiles,
            allImages: allImages,
            allVideos: allVideos,
            allDirectorys: allDirectorys,
            allLinesProject: allLinesProject,
            numberOfUnrecognizedFiles: numberOfUnrecognizedFiles);

  @override
  void showReport() {
    print('-|----------------------------------------------------');
    print('-|-----------------RELATORIO--------------------------');
    print('-|----------------------------------------------------');
    print('-| Existem ' +
        allLinesProject.toString() +
        ' linhas de código total no projeto');
    print('-| Existem ' + allFiles.length.toString() + ' Arquivos no projeto');
    print('-| Existem ' +
        allDirectorys.length.toString() +
        ' Diretorios no projeto');
    print('-| Existem ' +
        allImages.length.toString() +
        ' Arquivos de Imagem no projeto');
    print('-| Existem ' +
        allAudios.length.toString() +
        ' Arquivos de Audio no projeto');
    print('-| Existem ' +
        allVideos.length.toString() +
        ' Arquivos de Video no projeto');

    typeFilesAndLines.forEach((key, value) {
      if (FileExtension.extensionsLanguagens[key] != null) {
        print('-| Existem ' +
            value.toString() +
            ' linhas de código na linguagem ' +
            FileExtension.extensionsLanguagens[key]!);
      }
    });
    print('-| Existem ' +
        numberOfUnrecognizedFiles.toString() +
        ' Arquivos não reconhecidos no projeto :/');
    print('-|----------------------------------------------------');
  }
}
