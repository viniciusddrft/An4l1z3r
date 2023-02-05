import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import '../files_extencions/class_files_extensions.dart';
import '../report/abstract_report.dart';
import '../report/class_report.dart';
import 'abstract_an4l1z3r.dart';

class An4l1z3r extends An4l1z3rBase {
  const An4l1z3r({required super.raiz});

  @override
  Future<ReportBase> an4l1z3r() async {
    final allData = await Isolate.run<Map<String, Object>>(
      () async {
        final filesAndDirectorys = await _search();
        final allData = _analiz3rData(
            filesAndDirectorys['files'] as List<FileSystemEntity>);
        allData.addAll({
          'files': filesAndDirectorys['files']!,
          'directorys': filesAndDirectorys['directorys']!
        });
        return allData;
      },
    );

    return Report(
      files: allData['files'] as List<File>,
      directorys: allData['directorys'] as List<Directory>,
      allLinesProject: allData['allLinesProject'] as int,
      numberOfUnrecognizedFiles: allData['numberOfUnrecognizedFiles'] as int,
      typeFilesAndLines: allData['typeFilesAndLines'] as Map<String, int>,
      images: allData['images'] as List<String>,
      audios: allData['audios'] as List<String>,
      videos: allData['videos'] as List<String>,
    );
  }

  Future<Map<String, List<FileSystemEntity>>> _search() async {
    final List<FileSystemEntity> everythingInTheDirectory =
        raiz.listSync(recursive: true);

    final List<File> files = [];
    final List<Directory> directorys = [];

    for (FileSystemEntity iten in everythingInTheDirectory) {
      if (iten is File) {
        files.add(iten);
      } else if (iten is Directory) {
        directorys.add(iten);
      }
    }

    return {'files': files, 'directorys': directorys};
  }

  Map<String, Object> _analiz3rData(List<FileSystemEntity> files) {
    final List<String> images = [];
    final List<String> audios = [];
    final List<String> videos = [];
    final Map<String, int> typeFilesAndLines = {};
    int numberOfUnrecognizedFiles = 0;
    int allLinesProject = 0;

    for (File file in files as List<File>) {
      final List<String> filteredFile = file.path.split('.');

      try {
        if (filteredFile.length == 1 &&
            filteredFile.first.split('/').last.isNotEmpty) {
          if (typeFilesAndLines[FileExtension
                  .extensionsLanguagens[filteredFile.first.split('/').last]] ==
              null) {
            typeFilesAndLines[FileExtension
                    .extensionsLanguagens[filteredFile.first.split('/').last]
                as String] = file.readAsLinesSync(encoding: utf8).length;
            allLinesProject += file.readAsLinesSync(encoding: utf8).length;
          } else {
            typeFilesAndLines[FileExtension
                    .extensionsLanguagens[filteredFile.first.split('/').last]
                as String] = file
                    .readAsLinesSync(encoding: utf8)
                    .length +
                typeFilesAndLines[FileExtension
                    .extensionsLanguagens[filteredFile.first.split('/').last]]!;
            allLinesProject += file.readAsLinesSync(encoding: utf8).length;
          }
        }
      } on FileSystemException catch (_) {
        numberOfUnrecognizedFiles += 1;
      } on TypeError catch (_) {
        numberOfUnrecognizedFiles += 1;
      } catch (erro, stackTrace) {
        print(erro);
        print(stackTrace);
      }

      if (fileHasExtension(filteredFile)) {
        if (fileIsImage(filteredFile)) {
          images.add(file.path);
        } else if (fileIsAudio(filteredFile)) {
          audios.add(file.path);
        } else if (fileIsVideos(filteredFile)) {
          videos.add(file.path);
        } else {
          try {
            if (typeFilesAndLines[
                    FileExtension.extensionsLanguagens[filteredFile[1]]] ==
                null) {
              typeFilesAndLines[
                  FileExtension.extensionsLanguagens[filteredFile[1]]
                      as String] = file.readAsLinesSync(encoding: utf8).length;
            } else {
              typeFilesAndLines[
                  FileExtension.extensionsLanguagens[filteredFile[1]]
                      as String] = file.readAsLinesSync(encoding: utf8).length +
                  typeFilesAndLines[
                      FileExtension.extensionsLanguagens[filteredFile[1]]]!;
            }
            allLinesProject += file.readAsLinesSync(encoding: utf8).length;
          } on FileSystemException catch (_) {
            numberOfUnrecognizedFiles += 1;
          } on TypeError catch (_) {
            numberOfUnrecognizedFiles += 1;
          } catch (erro, stackTrace) {
            print(erro);
            print(stackTrace);
          }
        }
      }
    }
    return {
      'allLinesProject': allLinesProject,
      'numberOfUnrecognizedFiles': numberOfUnrecognizedFiles,
      'typeFilesAndLines': typeFilesAndLines,
      'images': images,
      'audios': audios,
      'videos': videos,
    };
  }
}
