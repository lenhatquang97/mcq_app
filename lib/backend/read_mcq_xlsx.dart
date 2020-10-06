import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
class ReadMCQ{
  String filePath;
  ReadMCQ({this.filePath});
  Future readFileMCQ() async{
    ByteData data = await rootBundle.load(filePath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    excel.tables['Sheet1'].rows.shuffle();
    return excel.tables['Sheet1'].rows;
  }
}