import 'abstract_report.dart';

class Report extends ReportBase {
  const Report({
    required super.allLinesProject,
    required super.typeFilesAndLines,
    required super.files,
    required super.directorys,
    required super.images,
    required super.audios,
    required super.videos,
    required super.numberOfUnrecognizedFiles,
  });

  @override
  void showReport() {
    print('-|----------------------------------------------------');
    print('-|-----------------RELATORIO--------------------------');
    print('-|----------------------------------------------------');
    print('-| Existem $allLinesProject linhas de código total no projeto');
    print('-| Existem ${files.length} Arquivos no projeto');
    print('-| Existem ${directorys.length} Diretorios no projeto');
    print('-| Existem ${images.length} Arquivos de Imagem no projeto');
    print('-| Existem ${audios.length} Arquivos de Audio no projeto');
    print('-| Existem ${videos.length} Arquivos de Video no projeto');

    typeFilesAndLines.forEach(
      (key, value) =>
          print('-| Existem $value linhas de código na linguagem $key'),
    );

    print(
        '-| Existem $numberOfUnrecognizedFiles Arquivos não reconhecidos no projeto :/');
    print('-|----------------------------------------------------');
  }
}
