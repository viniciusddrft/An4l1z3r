import 'dart:io';

abstract class ReportBase {
  final List<File> files;
  final List<Directory> directorys;
  final int allLinesProject;
  final int numberOfUnrecognizedFiles;
  final Map<String, int> typeFilesAndLines;
  final List<String> images;
  final List<String> audios;
  final List<String> videos;

  const ReportBase({
    required this.files,
    required this.directorys,
    required this.images,
    required this.audios,
    required this.videos,
    required this.allLinesProject,
    required this.typeFilesAndLines,
    required this.numberOfUnrecognizedFiles,
  });

  void showReport();
}
