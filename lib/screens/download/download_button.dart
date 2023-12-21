// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';

// class DownloadButton extends StatelessWidget {
//   const DownloadButton({
//     Key? key,
//     required this.url,
//     required this.filetype,
//     required this.filename,
//     required this.buttonname,
//   }) : super(key: key);

//   final String url;
//   final String filetype;
//   final String filename;
//   final String buttonname;

//   Future<void> downloadFile(String fileUrl) async {
//     final response = await http.get(Uri.parse(fileUrl));

//     if (response.statusCode == 200) {
//       final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//       final downloadsDirectory = Directory('${appDocumentsDirectory.path}/downloads');

//       if (!downloadsDirectory.existsSync()) {
//         downloadsDirectory.createSync(recursive: true);
//       }

//       final filePath = '${downloadsDirectory.path}/$filename.$filetype';

//       File file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);

//       print('File downloaded successfully to: $filePath');
//     } else {
//       throw Exception('Failed to download file');
//     }
//   }

//   Future<void> _downloadFile() async {
//     try {
//       await downloadFile(url);
//       print('Downloaded successfully');
//     } catch (e) {
//       print('Error downloading file: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: _downloadFile,
//       icon: const Icon(Icons.download),
//       label: Text("$buttonname"),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DownloadButton extends StatelessWidget {
//   const DownloadButton({
//     Key? key,
//     required this.url,
//     required this.filetype,
//     required this.filename,
//     required this.buttonname,
//   }) : super(key: key);

//   final String url;
//   final String filetype;
//   final String filename;
//   final String buttonname;

//   Future<void> downloadFile(String fileUrl) async {
//     final status = await Permission.storage.request();

//     if (status == PermissionStatus.granted) {
//       final downloadsDirectory = Directory('/Downloads');

//       if (!downloadsDirectory.existsSync()) {
//         downloadsDirectory.createSync(recursive: true);
//       }

//       final filePath = '${downloadsDirectory.path}/$filename.$filetype';

//       final response = await http.get(Uri.parse(fileUrl));

//       if (response.statusCode == 200) {
//         File file = File(filePath);
//         await file.writeAsBytes(response.bodyBytes);

//         print('File downloaded successfully to: $filePath');
//       } else {
//         throw Exception('Failed to download file');
//       }
//     } else {
//       throw Exception('Permission denied');
//     }
//   }

//   Future<void> _downloadFile() async {
//     try {
//       await downloadFile(url);
//       print('Downloaded successfully');
//     } catch (e) {
//       print('Error downloading file: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: _downloadFile,
//       icon: const Icon(Icons.download),
//       label: Text("$buttonname"),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
    required this.url,
    required this.filetype,
    required this.filename,
    required this.buttonname,
  }) : super(key: key);

  final String url;
  final String filetype;
  final String filename;
  final String buttonname;

  Future<void> downloadFile(String fileUrl) async {
    if (await Permission.storage.request().isGranted) {
      final externalDir = await getExternalStorageDirectory();

      if (externalDir == null) {
        throw Exception('External storage directory is null');
      }

      final downloadsDirectory = Directory('${externalDir.path}/Download');

      if (!downloadsDirectory.existsSync()) {
        downloadsDirectory.createSync(recursive: true);
      }

      final filePath = '${downloadsDirectory.path}/$filename.$filetype';

      final response = await http.get(Uri.parse(fileUrl));

      if (response.statusCode == 200) {
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        print('File downloaded successfully to: $filePath');
      } else {
        throw Exception('Failed to download file');
      }
    } else {
      throw Exception('Permission denied');
    }
  }

  Future<void> _downloadFile() async {
    try {
      await downloadFile(url);
      print('Downloaded successfully');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _downloadFile,
      icon: const Icon(Icons.download),
      label: Text("$buttonname"),
    );
  }
}
