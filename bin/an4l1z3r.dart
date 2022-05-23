import 'dart:io';

import 'package:an4l1z3r/an4l1z3r/class_an4l1z3r.dart';
import 'package:an4l1z3r/report/class_report.dart';

void main(List<String> arguments) {
  late final String pathInit;

  if (arguments.isNotEmpty) {
    pathInit = arguments[0];
    if (Directory(pathInit).existsSync()) {
      final An4l1z3r an4l1z3r = An4l1z3r(raiz: Directory(pathInit));
      late final Report report;
      an4l1z3r.an4l1z3r();
      report = Report(
        allLinesProject: an4l1z3r.allLinesProject,
        typeFilesAndLines: an4l1z3r.typeFilesAndLines,
        allFiles: an4l1z3r.allFiles,
        allDirectorys: an4l1z3r.allDirectorys,
        allImages: an4l1z3r.allImages,
        allAudios: an4l1z3r.allAudios,
        allVideos: an4l1z3r.allVideos,
        numberOfUnrecognizedFiles: an4l1z3r.numberOfUnrecognizedFiles,
      );
      report.showReport();
    } else {
      print('Esse diretorio não existe');
    }
  } else {
    print('para usar o analiz3r passe o caminho logo na frente');
    print('exemplo -> ./analizer.dart /path');
  }
}
