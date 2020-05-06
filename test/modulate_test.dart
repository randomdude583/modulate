import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:modulate/modulate.dart';

void main() {

  //"Test" in each base encoding, 2-10
  String B2 = "01010100011001010111001101110100";
  String B3 = "010010010202011021011022";
  String B4 = "1110121113031310";
  String B5 = "11424101421211";
  String B6 = "03143142430000000312";
  String B7 = "150203223224";
  String B8 = "2506256300000164";
  String B9 = "1136008000000138";
  String B10 = "2160529556";
  


  group('modulatePSK', () {
    test('modulatePSK_Base3', () {
      expect(modulatePSK(input: B2, outBase: 3, outWidth: 6), B3);
    });
    test('modulatePSK_Base4', () {
      expect(modulatePSK(input: B2, outBase: 4, outWidth: 4), B4);
    });
    test('modulatePSK_Base5', () {
      expect(modulatePSK(input: B2, outBase: 5, outWidth: 7), B5);
    });
    test('modulatePSK_Base6', () {
      expect(modulatePSK(input: B2, outBase: 6, outWidth: 10), B6);
    });
    test('modulatePSK_Base7', () {
      expect(modulatePSK(input: B2, outBase: 7, outWidth: 3), B7);
    });
    test('modulatePSK_Base8', () {
      expect(modulatePSK(input: B2, outBase: 8, outWidth: 8), B8);
    });
    test('modulatePSK_Base9', () {
      expect(modulatePSK(input: B2, outBase: 9, outWidth: 8), B9);
    });
    test('modulatePSK_Base10', () {
      expect(modulatePSK(input: B2, outBase: 10, outWidth: 5), B10);
    });
  });




  group('demodulatePSK', () {
    test('demodulatePSK_Base3', () {
      expect(demodulatePSK(input: B3, inBase: 3, inWidth: 6), B2);
    });
    test('demodulatePSK_Base4', () {
      expect(demodulatePSK(input: B4, inBase: 4, inWidth: 4), B2);
    });
    test('demodulatePSK_Base5', () {
      expect(demodulatePSK(input: B5, inBase: 5, inWidth: 7), B2);
    });
    test('demodulatePSK_Base6', () {
      expect(demodulatePSK(input: B6, inBase: 6, inWidth: 10), B2);
    });
    test('demodulatePSK_Base7', () {
      expect(demodulatePSK(input: B7, inBase: 7, inWidth: 3), B2);
    });
    test('demodulatePSK_Base8', () {
      expect(demodulatePSK(input: B8, inBase: 8, inWidth: 8), B2);
    });
    test('demodulatePSK_Base9', () {
      expect(demodulatePSK(input: B9, inBase: 9, inWidth: 8), B2);
    });
    test('demodulatePSK_Base10', () {
      expect(demodulatePSK(input: B10, inBase: 10, inWidth: 5), B2);
    });
  });








  group('modulatePSKFile', () {
    test('modulatePSKFile_', (){
      File file = new File("assets/testIn.txt");
      modulateFilePSK(file: file, base: 4, width: 4);
    });
  });



  String getStringFromBytes(ByteData data) {
    final buffer = data.buffer;
    var list = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return utf8.decode(list);
  }
  
  test('demoBytes', (){
    File file = new File("assets/testIn.txt");
    Uint8List bytes = file.readAsBytesSync();
    print(bytes);

  });





}
