import 'dart:io';

import 'package:an4l1z3r/an4l1z3r/class_an4l1z3r.dart';
import 'package:an4l1z3r/report/abstract_report.dart';

void main(List<String> arguments) {
  if (arguments.isNotEmpty) {
    final directoryInit = Directory(arguments[0]);
    if (directoryInit.existsSync()) {
      final an4l1z3r = An4l1z3r(raiz: directoryInit);
      an4l1z3r.an4l1z3r().then(
            (ReportBase reportBase) => reportBase.showReport(),
          );
    } else {
      print('Esse diretorio não existe');
    }
  } else {
    print('para usar o analiz3r passe o caminho logo na frente');
    print('exemplo -> ./analizer.dart /path');
  }
}
