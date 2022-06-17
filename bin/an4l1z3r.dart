import 'dart:io';

import 'package:an4l1z3r/an4l1z3r/class_an4l1z3r.dart';
import 'package:an4l1z3r/report/class_report.dart';

void main(List<String> arguments) {
  if (arguments.isNotEmpty) {
    final String pathInit = arguments[0];
    if (Directory(pathInit).existsSync()) {
      final An4l1z3r an4l1z3r = An4l1z3r(raiz: Directory(pathInit));
      an4l1z3r.an4l1z3r().then((Report report) => report.showReport());
    } else {
      print('Esse diretorio não existe');
    }
  } else {
    print('para usar o analiz3r passe o caminho logo na frente');
    print('exemplo -> ./analizer.dart /path');
  }
}
