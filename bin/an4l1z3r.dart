import 'dart:io';

import 'package:an4l1z3r/an4l1z3r/class_an4l1z3r.dart';
import 'package:an4l1z3r/report/class_report.dart';

void main(List<String> arguments) {
  late final String _pathInit;

  if (arguments.isNotEmpty) {
    _pathInit = arguments[0];
    if (Directory(_pathInit).existsSync()) {
      final An4l1z3r _an4l1z3r = An4l1z3r(raiz: Directory(_pathInit));
      late final Report _report;
      _an4l1z3r.an4l1z3r();
      _report = Report(
        allLinesProject: _an4l1z3r.allLinesProject,
        typeFilesAndLines: _an4l1z3r.typeFilesAndLines,
        allFiles: _an4l1z3r.allFiles,
        allDirectorys: _an4l1z3r.allDirectorys,
        allImages: _an4l1z3r.allImages,
        allAudios: _an4l1z3r.allAudios,
        allVideos: _an4l1z3r.allVideos,
        numberOfUnrecognizedFiles: _an4l1z3r.numberOfUnrecognizedFiles,
      );
      _report.showReport();
    } else {
      print('Esse diretorio não existe');
    }
  } else {
    print('para usar o analiz3r passe o caminho logo na frente');
    print('exemplo -> ./analizer.dart /path');
  }
}
