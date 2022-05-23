import 'abstract_report.dart';

import '../files_extencions/class_files_extensions.dart';

class Report extends ReportBase {
  const Report({
    required super.allLinesProject,
    required super.typeFilesAndLines,
    required super.allFiles,
    required super.allDirectorys,
    required super.allImages,
    required super.allAudios,
    required super.allVideos,
    required super.numberOfUnrecognizedFiles,
  });

  @override
  void showReport() {
    print('-|----------------------------------------------------');
    print('-|-----------------RELATORIO--------------------------');
    print('-|----------------------------------------------------');
    print('-| Existem $allLinesProject linhas de código total no projeto');
    print('-| Existem ${allFiles.length} Arquivos no projeto');
    print('-| Existem ${allDirectorys.length} Diretorios no projeto');
    print('-| Existem ${allImages.length} Arquivos de Imagem no projeto');
    print('-| Existem ${allAudios.length} Arquivos de Audio no projeto');
    print('-| Existem ${allVideos.length} Arquivos de Video no projeto');

    typeFilesAndLines.forEach((key, value) {
      if (FileExtension.extensionsLanguagens[key] != null) {
        print(
            '-| Existem $value linhas de código na linguagem ${FileExtension.extensionsLanguagens[key]!}');
      }
    });
    print(
        '-| Existem $numberOfUnrecognizedFiles Arquivos não reconhecidos no projeto :/');
    print('-|----------------------------------------------------');
  }
}
