import 'dart:convert';
import 'dart:io';

import 'abstract_an4l1z3r.dart';

class An4l1z3r extends An4l1z3rBase {
  An4l1z3r({required super.raiz});

  @override
  void an4l1z3r() {
    _searchDirectory(raiz);
    _analiz3rFiles();
  }

  void _searchDirectory(Directory directory) {
    final List<FileSystemEntity> everythingInTheDirectory =
        directory.listSync(recursive: true);

    for (FileSystemEntity iten in everythingInTheDirectory) {
      if (iten is File) {
        allFiles.add(iten);
      } else if (iten is Directory) {
        allDirectorys.add(iten);
      }
    }
  }

  void _analiz3rFiles() {
    for (File file in allFiles) {
      List<String> filteredFile = file.path.split('.');

      if (fileHasExtension(filteredFile)) {
        if (fileIsImage(filteredFile)) {
          allImages.add(file.path);
        } else if (fileIsAudio(filteredFile)) {
          allAudios.add(file.path);
        } else if (fileIsVideos(filteredFile)) {
          allVideos.add(file.path);
        } else {
          try {
            if (typeFilesAndLines[filteredFile[1]] == null) {
              typeFilesAndLines[filteredFile[1]] =
                  file.readAsLinesSync(encoding: utf8).length;
            } else {
              typeFilesAndLines[filteredFile[1]] =
                  file.readAsLinesSync(encoding: utf8).length +
                      typeFilesAndLines[filteredFile[1]]!;
            }
            allLinesProject += file.readAsLinesSync(encoding: utf8).length;
          } catch (error) {
            numberOfUnrecognizedFiles += 1;
          }
        }
      }
    }
  }
}
