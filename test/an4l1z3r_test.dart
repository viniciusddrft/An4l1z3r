import 'dart:io';

import 'package:an4l1z3r/an4l1z3r/class_an4l1z3r.dart';
import 'package:an4l1z3r/report/class_report.dart';
import 'package:test/test.dart';

void main() {
  group('An4l1z3r', () {
    test('search diretory', () {
      final An4l1z3r an4l1z3r = An4l1z3r(raiz: Directory('.'));

      expect(an4l1z3r.raiz.path, '.');
    });

    test('search files', () async {
      bool hasAn4l1z3r = false;
      bool hasReadme = false;

      final An4l1z3r an4l1z3r = An4l1z3r(raiz: Directory('.'));
      await an4l1z3r.an4l1z3r().then((Report report) {
        for (File file in report.files) {
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
