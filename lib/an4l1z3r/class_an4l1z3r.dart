import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:an4l1z3r/files_extencions/class_files_extensions.dart';
import 'package:an4l1z3r/report/class_report.dart';

import '../report/abstract_report.dart';

import 'abstract_an4l1z3r.dart';

class An4l1z3r extends An4l1z3rBase {
  const An4l1z3r({required super.raiz});

  @override
  Future<ReportBase> an4l1z3r() async {
    final Map<String, List<FileSystemEntity>> filesAndDirectorys =
        await _createIsolateSearch();

    final Map<String, dynamic> data = await _createIsolateAn4l1z3rData(
        filesAndDirectorys['files'] as List<File>);

    return Report(
        files: filesAndDirectorys['files'] as List<File>,
        directorys: filesAndDirectorys['directorys'] as List<Directory>,
        allLinesProject: data['allLinesProject'],
        numberOfUnrecognizedFiles: data['numberOfUnrecognizedFiles'],
        typeFilesAndLines: data['typeFilesAndLines'],
        images: data['images'],
        audios: data['audios'],
        videos: data['videos']);
  }

  Future<Map<String, List<FileSystemEntity>>> _createIsolateSearch() async {
    final ReceivePort receivePort = ReceivePort();

    await Isolate.spawn(_search, receivePort.sendPort);

    return await receivePort.first as Map<String, List<FileSystemEntity>>;
  }

  Future<Map<String, dynamic>> _createIsolateAn4l1z3rData(
      List<File> files) async {
    final ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(
        _analiz3rData, {'sendPort': receivePort.sendPort, 'files': files});

    return await receivePort.first as Map<String, dynamic>;
  }

  void _search(SendPort sendPort) async {
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

    Isolate.exit(sendPort, {'files': files, 'directorys': directorys});
  }

  void _analiz3rData(Map<String, dynamic> data) {
    final List<String> images = [];
    final List<String> audios = [];
    final List<String> videos = [];
    final Map<String, int> typeFilesAndLines = {};
    int numberOfUnrecognizedFiles = 0;
    int allLinesProject = 0;

    for (File file in data['files']) {
      final List<String> filteredFile = file.path.split('.');

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
          } catch (error) {
            numberOfUnrecognizedFiles += 1;
          }
        }
      }
    }
    Isolate.exit(data['sendPort'], {
      'allLinesProject': allLinesProject,
      'numberOfUnrecognizedFiles': numberOfUnrecognizedFiles,
      'typeFilesAndLines': typeFilesAndLines,
      'images': images,
      'audios': audios,
      'videos': videos,
    });
  }
}
