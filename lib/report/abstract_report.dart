import 'dart:io';

abstract class ReportBase {
  final int allLinesProject;
  final Map<String, int> typeFilesAndLines;
  final List<File> allFiles;
  final List<Directory> allDirectorys;
  final List<String> allImages;
  final List<String> allAudios;
  final List<String> allVideos;
  final int numberOfUnrecognizedFiles;

  const ReportBase({
    required this.allLinesProject,
    required this.typeFilesAndLines,
    required this.allFiles,
    required this.allDirectorys,
    required this.allImages,
    required this.allAudios,
    required this.allVideos,
    required this.numberOfUnrecognizedFiles,
  });

  void showReport();
}
