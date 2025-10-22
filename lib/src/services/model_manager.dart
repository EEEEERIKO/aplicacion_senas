import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

/// Simple model manager: downloads and stores TFLite models per locale.
class ModelManager {
  const ModelManager();

  Future<Directory> _appDir() async => await getApplicationDocumentsDirectory();

  Future<String> localModelPath(String localeCode, String filename) async {
    final dir = await _appDir();
    final modelsDir = Directory(p.join(dir.path, 'models', localeCode));
    if (!await modelsDir.exists()) await modelsDir.create(recursive: true);
    return p.join(modelsDir.path, filename);
  }

  Future<File> downloadModel(String url, String localeCode, {required String filename}) async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode != 200) throw Exception('Failed to download model');
    final path = await localModelPath(localeCode, filename);
    final file = File(path);
    await file.writeAsBytes(res.bodyBytes);
    return file;
  }

  Future<bool> modelExists(String localeCode, String filename) async {
    final path = await localModelPath(localeCode, filename);
    return File(path).exists();
  }
}
