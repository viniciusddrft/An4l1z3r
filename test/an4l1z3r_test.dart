import 'dart:io';

import 'package:an4l1z3r/an4l1z3r/class_an4l1z3r.dart';
import 'package:an4l1z3r/report/abstract_report.dart';
import 'package:test/test.dart';

void main() {
  group('An4l1z3r', () {
    test('search diretory', () {
      final an4l1z3r = An4l1z3r(raiz: Directory('.'));

      expect(an4l1z3r.raiz.path, '.');
    });

    test('search files', () async {
      bool hasAn4l1z3r = false;
      bool hasReadme = false;

      final an4l1z3r = An4l1z3r(raiz: Directory('.'));
      await an4l1z3r.an4l1z3r().then((ReportBase reportBase) {
        for (File file in reportBase.files) {
          if (file.path == './bin/an4l1z3r.dart') {
            hasAn4l1z3r = true;
          } else if (file.path == './README.md') {
            hasReadme = true;
          }
        }
        expect(hasAn4l1z3r, true);
        expect(hasReadme, true);
      });
    });
  });
}
