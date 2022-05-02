import 'dart:io';

import '../files_extencions/class_files_extensions.dart';

abstract class An4l1z3rBase {
  final Directory raiz;
  final List<File> allFiles = [];
  final List<Directory> allDirectorys = [];
  final Map<String, int> typeFilesAndLines = {};
  final List<String> allImages = [];
  final List<String> allAudios = [];
  final List<String> allVideos = [];
  int numberOfUnrecognizedFiles = 0;
  int allLinesProject = 0;

  An4l1z3rBase({required this.raiz});

  void an4l1z3r();

  bool fileHasExtension(List<String> file) => file.length > 1;

  bool fileIsImage(List<String> file) =>
      FileExtension.extensionsImages.contains(file[1]);

  bool fileIsVideos(List<String> file) =>
      FileExtension.extensionsVideos.contains(file[1]);

  bool fileIsAudio(List<String> file) =>
      FileExtension.extensionsAudios.contains(file[1]);
}
