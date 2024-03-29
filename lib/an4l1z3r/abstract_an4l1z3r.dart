import 'dart:io';
import '../files_extencions/class_files_extensions.dart';
import '../report/abstract_report.dart';

abstract base class An4l1z3rBase {
  final Directory raiz;

  const An4l1z3rBase({required this.raiz});

  Future<ReportBase> an4l1z3r();

  bool fileHasExtension(List<String> file) => file.length > 1;

  bool fileIsImage(List<String> file) =>
      FileExtension.extensionsImages.contains(file[1]);

  bool fileIsVideos(List<String> file) =>
      FileExtension.extensionsVideos.contains(file[1]);

  bool fileIsAudio(List<String> file) =>
      FileExtension.extensionsAudios.contains(file[1]);
}
